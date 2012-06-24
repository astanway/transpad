// gcc -o click click.m -framework ApplicationServices -framework Foundation

// File: 
// click.m
//
// Compile with: 
// gcc -o click click.m -framework ApplicationServices -framework Foundation -framework AppKit
//
// Usage:
// ./click -x pixels -y pixels 
// At the given coordinates it will click and release.


#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import <AppKit/NSEvent.h>


int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];


  // grabs command line arguments
  int x = (int) strtol(argv[1], NULL, 10);
  int y = (int) strtol(argv[2], NULL, 10);
  int click = (int) strtol(argv[3], NULL, 10);
  NSLog(@"%d, %d", x, y);

  // Here, we find the current mouse position so we can update it 
  // relative to the new offsets
  CGEventRef mouseEvent = CGEventCreate(NULL);
  CGPoint pt = CGEventGetLocation(mouseEvent);
  NSLog(@"%f, %f", pt.x, pt.y);
  
  pt.x += x;
  pt.y += y;

  // This is where the magic happens.  See CGRemoteOperation.h for details.
  //
  // CGPostMouseEvent( CGPoint        mouseCursorPosition,
  //                   boolean_t      updateMouseCursorPosition,
  //                   CGButtonCount  buttonCount,
  //                   boolean_t      mouseButtonDown, ... )
  //
  // So, we feed coordinates to CGPostMouseEvent, put the mouse there,
  // then click and release.
  
  if (click == 0){
    CGPostMouseEvent( pt, 1, 1, 0 );
  } else {
    CGPostMouseEvent( pt, 1, 1, 1 );
    CGPostMouseEvent( pt, 1, 1, 0 );  
  }


  [pool release];
  return 0;
}
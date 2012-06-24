// gcc -o click click.m -framework ApplicationServices -framework Foundation

// File: 
// click.m
//
// Compile with: 
// gcc -o click click.m -framework ApplicationServices -framework Foundation
//
// Usage:
// ./click -x pixels -y pixels 
// At the given coordinates it will click and release.


#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import <AppKit/NSEvent.h>


int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSUserDefaults *args = [NSUserDefaults standardUserDefaults];


  // grabs command line arguments -x and -y
  //
  int x = [args integerForKey:@"x"];
  int y = [args integerForKey:@"y"];
  int click = [args integerForKey:@"c"];


  // The data structure CGPoint represents a point in a two-dimensional
  // coordinate system.  Here, X and Y distance from upper left, in pixels.
  //
  CGPoint pt;
  pt.x = x;
  pt.y = y;
  

  // Here, we find the current mouse position so we can update it relative to the
  // new offsets
  NSPoint mouseLoc;
  mouseLoc = [NSEvent mouseLocation];

  int diffX = pt.x - mouseLoc.x;
  int diffY = pt.x - mouseLoc.y;
  
  if (diffX < 0){
      
  } else {
      
  }
  
  if (diffY < 0){
      
  } else {
      
  }

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
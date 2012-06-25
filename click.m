// Compile with: 
// gcc -o click click.m -framework ApplicationServices -framework Foundation -framework AppKit

#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>
#import <AppKit/NSScreen.h>

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

  // grab arguments
  int x = (int) strtol(argv[1], NULL, 10);
  int y = (int) strtol(argv[2], NULL, 10);
  int click = (int) strtol(argv[3], NULL, 10);
  
  // find current mouse position
  CGEventRef mouseEvent = CGEventCreate(NULL);
  CGPoint pt = CGEventGetLocation(mouseEvent);

  pt.x += x;
  pt.y += y;
  
  // NSRect screenRect = [[NSScreen mainScreen] frame];
  // NSLog(@"%f, %f", screenRect.size.height, screenRect.size.width);
  
  NSLog(@"x, y: %d %d", x, y);
  NSLog(@"position: %f %f", pt.x, pt.y);
  
  // CGPostMouseEvent( CGPoint        mouseCursorPosition,
  //                   boolean_t      updateMouseCursorPosition,
  //                   CGButtonCount  buttonCount,
  //                   boolean_t      mouseButtonDown, ... )  
  if (click == 0){
    CGPostMouseEvent( pt, 1, 1, 0 );
  } else {
    CGPostMouseEvent( pt, 1, 1, 1 );
    CGPostMouseEvent( pt, 1, 1, 0 );  
  }


  [pool release];
  return 0;
}
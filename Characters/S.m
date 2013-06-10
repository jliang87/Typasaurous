
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "S.h"


#define kMinimumCheckMarkLength   20

@implementation S

//called when you touch the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    lastPreviousPoint = point; //makes it equal to the point you are touching
    lastCurrentPoint = point; //makes it equal to the point you are touching
    lineLengthSoFar = 0.0f; // makes line length 0, f means float. i dont think you really need it.
	x = 0;	
}

//called when you move your finger
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
	
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    CGPoint currentPoint = [touch locationInView:self.view];
	
	CGFloat angle2 = fabs(angleBetweenPoints(currentPoint, previousPoint));//check CGPointUtils.c for details
      CGFloat angle3 = angleBetweenPoints(currentPoint, previousPoint);
	lastPreviousPoint = previousPoint;
	lastCurrentPoint = currentPoint;
	
	
	if(x == 0 && angle3 >= -60 && angle3 <= 0 && currentPoint.x < previousPoint.x) //if moving straight left 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 1; //change state
	}
    else if(currentPoint.x > previousPoint.x && angle2 < 20 && x == 0) 
        self.state = UIGestureRecognizerStateFailed;
	
	if (x == 1 )
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
	
	if((x == 2 && angle3 > 0 && angle3 <= 90 && currentPoint.x > previousPoint.x) || (x==2 && angle2 > 80 && currentPoint.y > previousPoint.y)) //if moving straight down 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 3;
	} 
    else if(x == 2 && currentPoint.y < previousPoint.y && angle3 < -20 && angle3 > -70)
        self.state = UIGestureRecognizerStateFailed;
//    else if(x == 2 && currentPoint.y < previousPoint.y && angle3 < -20 && angle3 > -60) //prevent up right 
//        self.state = UIGestureRecognizerStateFailed;
	
	if (x == 3 )
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if (x == 4 && angle3 >= -80 && angle3 < -10 && currentPoint.x < previousPoint.x) // moving straight left 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
	}
    else if(x == 4 && currentPoint.y < previousPoint.y && angle2 > 60) 
        self.state = UIGestureRecognizerStateFailed;
    
//   if( angle2 > 60 && currentPoint.y < previousPoint.y )
//        self.state = UIGestureRecognizerStateFailed;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event //called when finger lift off screen
{
    [super touchesEnded:touches withEvent:event];
	
	if ((self.state == UIGestureRecognizerStatePossible) && x == 5)
        self.state = UIGestureRecognizerStateRecognized; //recognized!
    else
        self.state = UIGestureRecognizerStateFailed;
	
	x = -1;
}


- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
    x = -1;
}

- (void)reset {
    [super reset];
    x = -1;
    
}

@end

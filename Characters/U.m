
#import "U.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define kMinimumCheckMarkLength   20

@implementation U

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
    CGFloat angle3 = angleBetweenPoints(currentPoint, previousPoint);//check CGPointUtils.c for details

	lastPreviousPoint = previousPoint;
	lastCurrentPoint = currentPoint;
	
	
	if(currentPoint.y > previousPoint.y && angle2 > 70 && x == 0) //if moving straight down
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 1; //change state
	}
    else if (currentPoint.y < previousPoint.y && x == 0)
        self.state = UIGestureRecognizerStateFailed;
//	else if(x == 0 && angle2 < 20 && currentPoint.x < previousPoint.x) 
//        self.state = UIGestureRecognizerStateFailed;
    
	if (x == 1) 
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
	
	if(x == 2 && currentPoint.x > previousPoint.x && angle2 < 40) //if moving straight right 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 5)
			x = 3;
    } 
//    else if(x == 2 && currentPoint.y < previousPoint.y && angle2 > 70)
//        self.state = UIGestureRecognizerStateFailed;
    
	
	if ( x == 3 )
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if(x == 4 && currentPoint.y < previousPoint.y && angle2 > 50) //go up
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
	}
    else  if (x ==4 && currentPoint.x < previousPoint.x && angle2 < 60)
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
        self.state = UIGestureRecognizerStateFailed;
    }
    if (x ==5 && currentPoint.x < previousPoint.x && angle2 < 60)
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
        self.state = UIGestureRecognizerStateFailed;
    }
	
	if ( x == 5 ) 
	{
		lineLengthSoFar = 0.0f;
		x = 6;
	}
	
	if((x == 6 && currentPoint.y > previousPoint.y && angle2 > 70) || (x==6 && currentPoint.y > previousPoint.y && angle3 < 90 && angle3 > 40)) //go down
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 15)
			x = 7;
	} 
    else  if (x ==6 && currentPoint.x < previousPoint.x && angle2 < 60)
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
        self.state = UIGestureRecognizerStateFailed;
    }
    if(x == 7 && angle3 < -50 && angle3 > -90 && currentPoint.y < previousPoint.y)
        self.state = UIGestureRecognizerStateFailed;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event //called when finger lift off screen
{
    [super touchesEnded:touches withEvent:event];
	
	if ((self.state == UIGestureRecognizerStatePossible) && x == 7)
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
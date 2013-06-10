

#import "B.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define kMinimumCheckMarkLength   20

@implementation B

CGPoint height;

//called when you touch the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    height.y = point.y;
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
	
	
	if(currentPoint.y > previousPoint.y && angle2 > 70 && x == 0) //if moving straight down
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > kMinimumCheckMarkLength)
			x = 1; //change state
	}
    else if((x == 0 && angle2 < 60 && currentPoint.x < previousPoint.x)) 
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
        if (lineLengthSoFar > 30)
            self.state = UIGestureRecognizerStateFailed;
    }
        
//    else if(x == 0 && angle2 < 30 && currentPoint.x < previousPoint.x)
//        self.state = UIGestureRecognizerStateFailed;
//    else if(angle3 < -30 && angle3 > -60 && currentPoint.y > previousPoint.y && x == 0) 
//        self.state = UIGestureRecognizerStateFailed;

	
	if ( x == 1) //changing state, set line distance to 0
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
	
    if((x == 2 && currentPoint.y < previousPoint.y && angle3 < 0 && angle3 >= -90))//if moving up right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 5)
			x = 3;
	}
//    else if(x == 2 && currentPoint.y < previousPoint.y && angle2 > 70)
//        self.state = UIGestureRecognizerStateFailed;
	
	if (x == 3 )
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if(x == 4 && currentPoint.x < previousPoint.x  && angle2 < 20) //if moving straight left
	{
        if (currentPoint.y < (height.y + 30))
        {
            self.state = UIGestureRecognizerStateFailed;
            x = -1;
        }
        else 
        {
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
        }
	}     

//    if(currentPoint.y > previousPoint.y && angle2 > 70 && x == 0) //if moving straight down
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 1; //change state
//	}
//	
//	if ( x == 1) //changing state, set line distance to 0
//	{
//		lineLengthSoFar = 0.0f;
//		x = 2;
//	}
//	
//    if(x == 2 && currentPoint.y < previousPoint.y && angle3 < -5 && angle3 > -60) //if moving up right
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 3;
//	}
//	
//	if (x == 3 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 4;
//	}
//	
//	if(x == 4 && currentPoint.y > previousPoint.y  && angle3 < -5 && angle3 > -60) //if moving straight left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 5;
//	}   
//    else if(x == 5 && angle3 <= 0 && angle3 >= -90 && currentPoint.y < previousPoint.y) 
//        self.state = UIGestureRecognizerStateFailed;
//}
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
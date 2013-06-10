
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "V.h"

#define kMinimumCheckMarkLength   20

@implementation V

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
	
	
	
	
	if( (x == 0 && angle3 > 50 && angle3 <= 90 && currentPoint.y > previousPoint.y) ||(x == 0 && angle2 > 80 && currentPoint.y > previousPoint.y ))//if moving down-right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 20)
			x = 1;
	} 
    else if (x == 0 && currentPoint.y < previousPoint.y)
        self.state = UIGestureRecognizerStateFailed;
//    else if(x == 0 && angle3 >= -90 && angle3 < -50 && currentPoint.y < previousPoint.y)
//        self.state = UIGestureRecognizerStateFailed;
//    else if(currentPoint.y < previousPoint.y && angle3 >= 30 && x == 0 && angle3 < 70)
//        self.state = UIGestureRecognizerStateFailed;
//    else     if((angle3 < -50 && angle3 >= -90 && currentPoint.y < previousPoint.y && x == 0) || (x== 0 && angle2 >80 && currentPoint.y < previousPoint.y ))
//        self.state = UIGestureRecognizerStateFailed;
	
	
	if (x == 1) 
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
	
	if((x == 2 && angle3 < -50 && angle3 >= -90 && currentPoint.y < previousPoint.y) ||(x == 2 && angle2 > 80 && currentPoint.y < previousPoint.y ))//if moving up-right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 20)
			x = 3;
	} 
	
	if (x == 3) 
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if(x == 4 && angle2 < 30 && currentPoint.x > previousPoint.x) //if moving straight right 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
	} 	
    else if(x == 4 && currentPoint.x < previousPoint.x  && angle2 < 20)
        self.state = UIGestureRecognizerStateFailed;
    else if(x == 4 && angle3 > 50 && angle3 <= 90 && currentPoint.y > previousPoint.y)
        self.state = UIGestureRecognizerStateFailed;
    
    if((x == 5 && angle3 < -50 && angle3 > -90 && currentPoint.y < previousPoint.y) || (x == 5 && angle2 > 80 && currentPoint.y < previousPoint.y ))
        self.state = UIGestureRecognizerStateFailed;
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

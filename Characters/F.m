


#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "F.h"

#define kMinimumCheckMarkLength   20

@implementation F

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
	
	
//	if(currentPoint.y < previousPoint.y && angle2 > 70 && x == 0) //if moving straight up
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//			x = 1; //change state
//	}
//	
//	if (x == 1 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 2;
//	}
//	
//	if(x == 2 && angle2 < 20 && currentPoint.x > previousPoint.x) //if moving straight right
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//			x = 3;
//	} 
//    
//	if (x == 3 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 4;
//	}
//	
//	if(x == 4 && angle3 < -10 && angle3 > -40 && currentPoint.y > previousPoint.y) //if moving down left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//			x = 5;
//	} 
//    
//    if (x == 5 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 6;
//	}
//	
//	if(x == 6 && angle2 < 20 && currentPoint.x > previousPoint.x) //if moving straight right
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//			x = 7;
//	} 
    
    if((currentPoint.y < previousPoint.y && angle2 > 70 && x == 0) || (x==0 && currentPoint.y < previousPoint.y && angle3 < 90 && angle3 > 60)) //if moving straight up
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 20)
			x = 1; //change state
	}
	
//    if((x == 1 && currentPoint.y > previousPoint.y && angle3 > 50 && angle3 <= 90) || (x== 1 && angle2 >50 && currentPoint.y > previousPoint.y ))
//    {
//     lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//     if (lineLengthSoFar > 10)
//        self.state = UIGestureRecognizerStateFailed;
//    }
     
	if (x == 1 )
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
    
	
	if(x == 2 && angle2 < 30 && currentPoint.x > previousPoint.x) //if moving straight right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 3;
	} 
//    else if((x == 2 && currentPoint.y > previousPoint.y && angle3 > 50 && angle3 <= 90) || (x== 2 && angle2 >50 && currentPoint.y > previousPoint.y ))
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//        if (lineLengthSoFar > 10)
//            self.state = UIGestureRecognizerStateFailed;
//    }

//    if((x == 3 && currentPoint.y > previousPoint.y && angle3 > 50 && angle3 <= 90) || (x== 3 && angle2 >80 && currentPoint.y > previousPoint.y ))
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//        if (lineLengthSoFar > 10)
//            self.state = UIGestureRecognizerStateFailed;
//    }
    
	if (x == 3 )
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if(x == 4 && angle3 < -10 && angle3 > -70 && currentPoint.y > previousPoint.y) //if moving down left
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
	} 
//    else  if((x == 4 && currentPoint.y > previousPoint.y && angle3 > 50 && angle3 <= 90) || (x== 4 && angle2 >=80 && currentPoint.y > previousPoint.y ))
//  
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 10)
//             self.state = UIGestureRecognizerStateFailed;
//    }
 
//    else if ((x == 4 && angle3 <= 90 && angle3 > 0 && currentPoint.y < previousPoint.y) || (x == 4 && angle2 < 40 && currentPoint.x < previousPoint.x)) 
//        self.state = UIGestureRecognizerStateFailed;
//    
//    if((x == 5 && angle3 <= 90 && angle3 > 0 && currentPoint.y < previousPoint.y) || (x ==5 && angle2 < 40 && currentPoint.x < previousPoint.x)) 
//        self.state = UIGestureRecognizerStateFailed;
    
    if (x == 5 )
	{
		lineLengthSoFar = 0.0f;
		x = 6;
	}
	
	if(x == 6 && angle2 < 30 && currentPoint.x > previousPoint.x) //if moving straight right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 7;
	} 
    else if ((x == 6 && angle3 <= 90 && angle3 > 0 && currentPoint.y < previousPoint.y) || (x == 6 && angle2 < 10 && currentPoint.x < previousPoint.x)) 
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
             self.state = UIGestureRecognizerStateFailed;
    }
       
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

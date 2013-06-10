

#import "A.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define kMinimumCheckMarkLength   20

@implementation A


//called when you touch the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    lastPreviousPoint = point; //makes it equal to the point you are touching
    lastCurrentPoint = point; //makes it equal to the point you are touching
    lineLengthSoFar = 0.0f; // makes line length 0, f means float. i dont think you really need it.
	x = 0; //initialize state to 0
}

//called when you move your finger
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
	
    CGPoint previousPoint = [touch previousLocationInView:self.view];
    CGPoint currentPoint = [touch locationInView:self.view];
	
	CGFloat angle2 = fabs(angleBetweenPoints(currentPoint, previousPoint));
    CGFloat angle3 = angleBetweenPoints(currentPoint, previousPoint);//check CGPointUtils.c for details
	lastPreviousPoint = previousPoint;
	lastCurrentPoint = currentPoint;
    
    if((angle3 < -50 && angle3 >= -90 && currentPoint.y < previousPoint.y && x == 0) || (x== 0 && angle2 >80 && currentPoint.y < previousPoint.y )) //if moving down left
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > kMinimumCheckMarkLength)
			x = 1; //change state
	}
    
	if ( x == 1) //make distance equal to 0 
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
    
	if((x == 2 && currentPoint.y > previousPoint.y && angle3 > 50 && angle3 <= 90) || (x== 2 && angle2 >80 && currentPoint.y > previousPoint.y )) //if moving straight right 
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > kMinimumCheckMarkLength)
			x = 3;
	} 
    //	else if(x == 2 && angle3 > 20 && angle3 < 60 && currentPoint.y > previousPoint.y) 
    //        self.state = UIGestureRecognizerStateFailed;
    
	if (x == 3 )
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	if((x == 4 && angle3 <= 70 && angle3 > 0 && currentPoint.y < previousPoint.y) || (x ==4 && angle2 < 20 && currentPoint.x < previousPoint.x)) //if moving up left
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x = 5;
    }
    
    if (x == 5 )
	{
		lineLengthSoFar = 0.0f;
		x = 6;
	}
	
	if(x == 6 && angle2 < 30 && currentPoint.x > previousPoint.x) //if moving up left
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > kMinimumCheckMarkLength)
			x = 7;
    }
	
//	if(angle3 < -30 && angle3 > -80 && currentPoint.y > previousPoint.y && x == 0) //if moving down left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 1; //change state
//	}
//    
//	if ( x == 1) //make distance equal to 0 
//	{
//		lineLengthSoFar = 0.0f;
//		x = 2;
//	}
//
//	if(x == 2 && currentPoint.x > previousPoint.x && angle2 < 10) //if moving straight right 
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 3;
//	} 
////	else if(x == 2 && angle3 > 20 && angle3 < 60 && currentPoint.y > previousPoint.y) 
////        self.state = UIGestureRecognizerStateFailed;
//    
//	if (x == 3 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 4;
//	}
//	
//	if(x == 4 && angle3 > 30 && angle3 <= 90 && currentPoint.y < previousPoint.y) //if moving up left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 5;
//    }
    
//    if (angle2 > 0 && currentPoint.x < previousPoint.x && x == 0)
//    {
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 1; //change state
//	}
//    
//    if (x == 1) //make distance equal to 0 
//	{
//		lineLengthSoFar = 0.0f;
//		x = 2;
//	}
//    
//	if(x == 2 && currentPoint.y > previousPoint.y && angle3 < -60 && angle3 >= -90) //if moving straight right 
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 3;
//	} 
//    
//    if (x == 3 )
//	{
//		lineLengthSoFar = 0.0f;
//		x = 4;
//	}
//	
//	if(x == 4 && angle3 < -20 && angle3 > -60 && currentPoint.y < previousPoint.y) //if moving up left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 5;
//    }
//    
//    if (x == 5 )
//	{
//        if (lineLengthSoFar > 50)
//        {
//            self.state = UIGestureRecognizerStateFailed;
//            x = -1;
//        }
//		lineLengthSoFar = 0.0f;
//		x = 6;
//	}
//	
//	if(x == 6 && angle2 > 70 && currentPoint.y > previousPoint.y) //if moving up left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 5)
//			x = 7;
//    }
//    
//    if (x == 7)
//	{
//		lineLengthSoFar = 0.0f;
//		x = 8;
//	}
//	
//	if(x == 8 && angle3 <= 0 && angle3 >= -90 && currentPoint.y < previousPoint.y) //if moving up left
//	{
//		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > kMinimumCheckMarkLength)
//			x = 9;
//    }
    

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


#import "O.h"
#import "CGPointUtils.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define kMinimumCheckMarkAngle    70
#define kMinimumCheckMarkLength   20

@implementation O
CGPoint height;
CGPoint point;

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
	
	
	if((x == 0 && angle2 < 20 && currentPoint.x < previousPoint.x) || (x ==0 && angle3 < 0 &&  angle3 > -90 && currentPoint.x < previousPoint.x)) //if moving straight right
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 5)
			x = 1;
	} 
    else if(currentPoint.x > previousPoint.x && x == 0 && angle3 > 0 && angle3 < 90)
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 5)
            self.state = UIGestureRecognizerStateFailed;
    }
//    else if(currentPoint.y < previousPoint.y && angle3 >= 30 && x == 0 && angle3 < 60)
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//        if (lineLengthSoFar > 20)
//            self.state = UIGestureRecognizerStateFailed;
//    }
//    if(currentPoint.y < previousPoint.y && angle3 >= 30 && x == 1 && angle3 < 60)
//        self.state = UIGestureRecognizerStateFailed;
//    else if(x == 0 && currentPoint.y > previousPoint.y && angle2 > 70 ) 
//        self.state = UIGestureRecognizerStateFailed;
//    else if(currentPoint.y > previousPoint.y && angle3 < -30 && angle3 > -60  && x == 0) 
//        self.state = UIGestureRecognizerStateFailed;
	
	
	if (x == 1 )
	{
		lineLengthSoFar = 0.0f;
		x = 2;
	}
	
	
	if(currentPoint.y > previousPoint.y && angle3 < -50 && angle3 >= -90 && x == 2) //if moving straight down
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
			x =3 ; //change state
	}
    else if(x == 2 && currentPoint.y < previousPoint.y && angle3 < -20 && angle3 > -70)
        self.state = UIGestureRecognizerStateFailed;
//    else if(x == 2 && angle3 > 0 && angle3 <= 50 && currentPoint.y > previousPoint.y)
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//        self.state = UIGestureRecognizerStateFailed;
//    }
    
//    else if(x == 2 && angle3 >= 0 && angle3 <= 60 && currentPoint.y > previousPoint.y) 
//        self.state = UIGestureRecognizerStateFailed;
	
    
	if (x == 3)
	{
		lineLengthSoFar = 0.0f;
		x = 4;
	}
	
	
	if(x == 4 && angle2 < 30 && currentPoint.x > previousPoint.x) //if moving straight left
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 5)
        {
			x = 5;
           
        }
	} 
//    else if(x == 4 && currentPoint.y < previousPoint.y && angle3 <= -30 && angle3 > -60) 
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//            self.state = UIGestureRecognizerStateFailed;
//    }
//    if(x == 5 && currentPoint.y < previousPoint.y && angle3 <= -30 && angle3 > -60) 
//    {
//        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
//		if (lineLengthSoFar > 20)
//            self.state = UIGestureRecognizerStateFailed;
//    }
	
	
	if (x == 5 )
	{
		lineLengthSoFar = 0.0f;
		x = 6 ;
	}
	
	
	if((x == 6 && currentPoint.y < previousPoint.y && angle2 > 60) || (x == 6 && currentPoint.x < previousPoint.x && angle2 < 30)) //if moving straight up
	{
		lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > kMinimumCheckMarkLength && fabs(currentPoint.y - height.y) < 30 )
		{	
            x = 7;
             height.x = currentPoint.x;
            height.y = currentPoint.y;
        }
        
	}
    if (x == 7 && currentPoint.x > previousPoint.x && angle2 < 30) 
    {
        lineLengthSoFar += distanceBetweenPoints(previousPoint, currentPoint);
		if (lineLengthSoFar > 10)
            self.state = UIGestureRecognizerStateFailed;
    }
 
    
    if (x == 7)
    {
        point.y = currentPoint.y;
        point.x = currentPoint.x;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event //called when finger lift off screen
{
    [super touchesEnded:touches withEvent:event];
	
	if ((self.state == UIGestureRecognizerStatePossible) && x == 7 )
    {
        if (point.y > (height.y))
        {
            if (point.x < fabs(height.x - 20))
                self.state = UIGestureRecognizerStateRecognized; 
            else
                self.state = UIGestureRecognizerStateFailed;//recognized!
        }
        else if (point.x < (height.x))
            self.state = UIGestureRecognizerStateRecognized;
    }
            
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
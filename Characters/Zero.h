
#import <Foundation/Foundation.h>


@interface Zero : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
    

	
	
}

@end

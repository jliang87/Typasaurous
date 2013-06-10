
#import <Foundation/Foundation.h>


@interface One : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
    

	
	
}

@end

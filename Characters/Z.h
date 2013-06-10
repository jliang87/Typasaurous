
#import <Foundation/Foundation.h>


@interface Z : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
    
	
}

@end

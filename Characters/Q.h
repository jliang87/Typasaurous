
#import <Foundation/Foundation.h>

@interface Q : UIGestureRecognizer {
    CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
}
@end

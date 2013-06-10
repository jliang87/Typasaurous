
#import <Foundation/Foundation.h>

@interface S : UIGestureRecognizer {
    CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
}
@end

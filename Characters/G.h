

#import <Foundation/Foundation.h>

@interface G : UIGestureRecognizer {
    CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
}
@end

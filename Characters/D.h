

#import <Foundation/Foundation.h>

@interface D : UIGestureRecognizer {
    CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
}
@end

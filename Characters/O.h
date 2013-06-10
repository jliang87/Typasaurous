
#import <Foundation/Foundation.h>

@interface O : UIGestureRecognizer {
    CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
}
@end

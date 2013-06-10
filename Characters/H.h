

#import <Foundation/Foundation.h>


@interface H : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states

}

@end

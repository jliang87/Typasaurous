
#import <Foundation/Foundation.h>


@interface V : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
    

}

@end

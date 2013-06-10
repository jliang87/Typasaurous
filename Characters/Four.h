

#import <Foundation/Foundation.h>


@interface Four : UIGestureRecognizer {
	CGPoint     lastPreviousPoint; 
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar; 
	int x; // for states
    

	
	
}

@end

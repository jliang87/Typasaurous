//
//  TypasaurousAppDelegate.h
//  Typasaurous
//
//  Created by jack  liang on 11-07-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TypasaurousViewController;

@interface TypasaurousAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TypasaurousViewController *viewController;

@end

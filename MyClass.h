//
//  MainView.h
//  SimpleTextInput
//
//  Created by jack  liang on 11-07-02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Squiggle.h"
#include <objc/runtime.h>

@interface MainView : UIView
{
    NSMutableDictionary *squiggles; // squiggles in progress
    NSMutableArray *finishedSquiggles; // finished squiggles
    UIColor *color; // the current drawing color
    float lineWidth; // the current drawing line width
} // end instance variable declaration

// declare color and lineWidth as properties
@property(nonatomic, retain) UIColor *color;
@property float lineWidth;

// draw the given Squiggle into the given graphics context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context; 
- (void)resetView; // clear all squiggles from the view
@end // end interface MainView


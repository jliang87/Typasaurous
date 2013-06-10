//
//  EGOTextView_DemoViewController.h
//  EGOTextView_Demo
//
//  Created by Devin Doty on 4/18/11.
//  Copyright 2011 enormego. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "K.h"
#import "A.h"
#import "C.h"
#import "D.h"
#import "F.h"
#import "S.h"
#import "B.h"
#import "E.h"
#import "G.h"
#import "X.h"
#import "Y.h"
#import "M.h"
#import "N.h"
#import "P.h"
#import "Q.h"
#import "R.h"
#import "I.h"
#import "J.h"
#import "L.h"
#import "U.h"
#import "O.h"
#import "H.h"
#import "T.h"
#import "V.h"
#import "W.h"
#import "Z.h"
#import "Two.h"
#import "Three.h"
#import "Four.h"
#import "Five.h"
#import "Six.h"
#import "Seven.h"
#import "Eight.h"
#import "Nine.h"
#import "Zero.h"
#import "One.h"
#import "MyClass.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@class EGOTextView;


@interface EGOTextView_DemoViewController : UIViewController <UIActionSheetDelegate, MFMailComposeViewControllerDelegate ,MFMessageComposeViewControllerDelegate> {
    
    IBOutlet EGOTextView *_egoTextView;
    IBOutlet MainView *mainview;
    K *k;
    A *a;
	C *c;
	D *d;
	F *f;
	S *s;
	B *b;
	E *e;
	G *g;
	X *x;
	Y *y;
    M *m;
	N *n;
	P *p;
	Q *q;
	R *r;
	I *i;
	J *j;
	L *l;
	U *u;
	O *o;
	H *h;
	T *t;
	V *v;
	W *w;
	Z *z;
	
	Two *two;
	Three *three;
	Four *four;
	Five *five;
	Six *six;
	Seven *seven;
	Eight *eight;
	Nine  *nine;
	Zero  *zero;
	One   *one;
    
    int state;
    int counter;
    UIImageView *imageview;
    
   // Reachability* internetReachable;
    //Reachability* hostReachable;
    
   // BOOL internetActive;
    
}

@property(nonatomic,retain) EGOTextView *egoTextView;
@property(nonatomic,retain) MainView *mainview;
@property(nonatomic, retain) UIImageView *imageview;

- (void)showImageWithText:(NSString *)string atPoint:(CGPoint)centerPoint;
-(void)displayComposerSheet;
-(void) displayComposer;
-(void)messageComposerSheet;


@end

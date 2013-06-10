//
//  EGOTextView_DemoViewController.m
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

#import "EGOTextView_DemoViewController.h"
#import "EGOTextView.h"
#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation EGOTextView_DemoViewController

@synthesize egoTextView=_egoTextView;
@synthesize mainview;
@synthesize imageview;


#pragma mark -
#pragma mark - View lifecycle



- (void)viewDidLoad {
    [super viewDidLoad];
	
    
    UIImageView *anImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 75.0)];
    anImageView.contentMode = UIViewContentModeCenter;
    self.imageview = anImageView;
    [anImageView release];
    [self.view addSubview:imageview];
    
    state = 1;
    counter = 1;
	
    k = [[K alloc] initWithTarget:self action:@selector(doCheckK:)];
    a = [[A alloc] initWithTarget:self action:@selector(doCheckA:)];	
    c = [[C alloc] initWithTarget:self action:@selector(doCheckC:)];
    d = [[D alloc] initWithTarget:self action:@selector(doCheckD:)];
    f = [[F alloc] initWithTarget:self action:@selector(doCheckF:)];
    s = [[S alloc] initWithTarget:self action:@selector(doCheckS:)];
    b = [[B alloc] initWithTarget:self action:@selector(doCheckB:)];
    e = [[E alloc] initWithTarget:self action:@selector(doCheckE:)];
    g = [[G alloc] initWithTarget:self action:@selector(doCheckG:)];	
    x = [[X alloc] initWithTarget:self action:@selector(doCheckX:)];	
    y = [[Y alloc] initWithTarget:self action:@selector(doCheckY:)];
    m = [[M alloc] initWithTarget:self action:@selector(doCheckM:)];
    n = [[N alloc] initWithTarget:self action:@selector(doCheckN:)];
    p = [[P alloc] initWithTarget:self action:@selector(doCheckP:)];	
    q = [[Q alloc] initWithTarget:self action:@selector(doCheckQ:)];	
    r = [[R alloc] initWithTarget:self action:@selector(doCheckR:)];
    i = [[I alloc] initWithTarget:self action:@selector(doCheckI:)];
    j = [[J alloc] initWithTarget:self action:@selector(doCheckJ:)];
    l = [[L alloc] initWithTarget:self action:@selector(doCheckL:)];
    u = [[U alloc] initWithTarget:self action:@selector(doCheckU:)];
    o = [[O alloc] initWithTarget:self action:@selector(doCheckO:)];
    h = [[H alloc] initWithTarget:self action:@selector(doCheckH:)];
    t = [[T alloc] initWithTarget:self action:@selector(doCheckT:)];
    v = [[V alloc] initWithTarget:self action:@selector(doCheckV:)];
    w = [[W alloc] initWithTarget:self action:@selector(doCheckW:)];
    z = [[Z alloc] initWithTarget:self action:@selector(doCheckZ:)];
	two = [[Two alloc] initWithTarget:self action:@selector(doCheckTwo:)];
	three = [[Three alloc] initWithTarget:self action:@selector(doCheckThree:)];
	four = [[Four alloc] initWithTarget:self action:@selector(doCheckFour:)];
	five = [[Five alloc] initWithTarget:self action:@selector(doCheckFive:)];
	six = [[Six alloc] initWithTarget:self action:@selector(doCheckSix:)];
	seven = [[Seven alloc] initWithTarget:self action:@selector(doCheckSeven:)];
	eight = [[Eight alloc] initWithTarget:self action:@selector(doCheckEight:)];
	nine = [[Nine alloc] initWithTarget:self action:@selector(doCheckNine:)];
	zero = [[Zero alloc] initWithTarget:self action:@selector(doCheckZero:)];
	one = [[One alloc] initWithTarget:self action:@selector(doCheckOne:)];
    
    //self.mainview.backgroundColor = [UIColor clearColor];
	//    
	//    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"UITextView", @"EGOTextView", nil]];
	//    segment.segmentedControlStyle = UISegmentedControlStyleBar;
	//    [segment addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
	//    self.navigationItem.titleView = segment;
	//    [segment release];
	
	
    if (_egoTextView==nil) {
        
        EGOTextView *view = [[EGOTextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height)];
        view.delegate = (id<EGOTextViewDelegate>)self;
        view.backgroundColor = [UIColor clearColor];
        [self.view addSubview:view];
        self.egoTextView = view;
        [view release]; 
    }
    
    MainView *view = [[MainView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width - 17, self.view.bounds.size.height)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    self.mainview = view;
    [view release];
	
    [self.view addGestureRecognizer:c];
    [self.view addGestureRecognizer:k];
    [self.view addGestureRecognizer:a];
    [self.view addGestureRecognizer:d];
    [self.view addGestureRecognizer:f];
    [self.view addGestureRecognizer:s];
    [self.view addGestureRecognizer:b];
    [self.view addGestureRecognizer:e];
    [self.view addGestureRecognizer:g];
    [self.view addGestureRecognizer:x];
    [self.view addGestureRecognizer:y];
    [self.view addGestureRecognizer:m];
    [self.view addGestureRecognizer:n];
    [self.view addGestureRecognizer:p];
    [self.view addGestureRecognizer:q];
    [self.view addGestureRecognizer:r];
    [self.view addGestureRecognizer:i];
    [self.view addGestureRecognizer:j];
    [self.view addGestureRecognizer:l];
    [self.view addGestureRecognizer:u];
    [self.view addGestureRecognizer:o];
    [self.view addGestureRecognizer:h];
    [self.view addGestureRecognizer:t];
    [self.view addGestureRecognizer:v];
    [self.view addGestureRecognizer:w];
    [self.view addGestureRecognizer:z];
	
	//    if (_textegoTextView==nil) {
	//        
	//        UITextegoTextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.view.bounds.size.width, self.view.bounds.size.height-216.0f)];
	//        textView.font = self.egoTextView.font;
	//        [self.view addSubview:textView];
	//        self.textView = textView;
	//        [textView release];
	//        
	//    }
	//        
	//    [segment setSelectedSegmentIndex:1];
    
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    gesture.delegate = (id<UIGestureRecognizerDelegate>)self;
    [self.view addGestureRecognizer:gesture];
    [gesture release];
    //_longPress = gesture;
    
    UILongPressGestureRecognizer *ges = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(linda:)];
    [ges setNumberOfTouchesRequired:4];
    [ges setMinimumPressDuration:4];
    [self.view addGestureRecognizer:ges];
    [ges release];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    [doubleTap release];
    
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [singleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:singleTap];
    [singleTap release];
    
//    UITapGestureRecognizer *space =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(space:)];
//    [space setNumberOfTouchesRequired:3];
//    [self.view addGestureRecognizer:space];
//    [space release];
//    
    
    UISwipeGestureRecognizer *twotap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twotap:)];
    twotap.numberOfTouchesRequired = 2;
    twotap.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:twotap];
    [twotap release];
    
    
    UISwipeGestureRecognizer *threetap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(threetap:)];
    threetap.numberOfTouchesRequired = 2;
    threetap.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:threetap];
    [threetap release];
    
    UISwipeGestureRecognizer *doubletap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doubletap:)];
    doubletap.numberOfTouchesRequired = 2;
    doubletap.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:doubletap];
    [doubletap release];
    
    UISwipeGestureRecognizer *tripletap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tripletap:)];
    tripletap.numberOfTouchesRequired = 3;
    [tripletap setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:tripletap];
    [tripletap release];
    
    UISwipeGestureRecognizer *rotate = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotate.direction = UISwipeGestureRecognizerDirectionUp;
    rotate.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:rotate];
    [rotate release];
    
    UISwipeGestureRecognizer *fourtap = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(fourtap:)];
    fourtap.numberOfTouchesRequired = 3;
    [fourtap setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:fourtap];
    [fourtap release];
    
	//    UISwipeGestureRecognizer *singletap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(singletap:)];
	//    singletap.numberOfTouchesRequired = 2;
	//    singletap.direction = UISwipeGestureRecognizerDirectionUp;
	//    [self.view addGestureRecognizer:singletap];
	//    [singletap release];
	
	//send button
	UIBarButtonItem *sendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(styleAction:)];
	self.navigationItem.rightBarButtonItem = sendButton;
	[sendButton release];
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [infoButton addTarget:self action:@selector(openTutorial:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *iButton = [[UIBarButtonItem alloc] initWithCustomView: infoButton];
    self.navigationItem.leftBarButtonItem = iButton;
    [iButton release];
	
    
}

- (IBAction)openTutorial:(id)sender 
{
    
//    internetReachable = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    
//    internetReachable = [[Reachability reachabilityForInternetConnection] retain];
//    [internetReachable startNotifier];
//    
//  
//
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
//    
//    // check if a pathway to a random host exists
////    hostReachable = [[Reachability reachabilityWithHostName: @"www.apple.com"] retain];
////    [hostReachable startNotifier];
//
//    if (internetActive == NO)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Typasaurous" message:@"This online tutorial needs Internet connection. Please connect to the Internet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alert show];
//        [alert release];
//    }
//    else if (internetActive == YES)
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
   
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
       
        /// Create an alert if connection doesn't work
        
        UIAlertView *myAlert = [[UIAlertView alloc]
                                
                                initWithTitle:@"Typasaurous"   message:@"This online tutorial needs Internet connection. Sorry for the inconvenience."
                                
                                delegate:self
                               
                                cancelButtonTitle:@"OK"
                              
                                otherButtonTitles:nil];
        
        [myAlert show];
        
        [myAlert release];
    }
    else
    {
	FirstViewController *tempWebView = [[FirstViewController alloc] init];
    
	[self presentModalViewController:tempWebView animated:YES];
    }
    
    counter = 1;
    [_egoTextView setEditable:NO];
    [_egoTextView resignFirstResponder];

    //[[NSNotificationCenter defaultCenter] removeObserver:self];
}

//- (void) checkNetworkStatus:(NSNotification *)notice
//{
//    // called after network status changes
//    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
//    
//    switch (internetStatus)
//    {
//        case NotReachable:
//            NSLog(@"The internet is down.");
//            internetActive = NO;
//            break;
//        case ReachableViaWiFi:
//            NSLog(@"The internet is working via WIFI.");
//            internetActive = YES;
//            break;
//        case ReachableViaWWAN:
//            NSLog(@"The internet is working via WWAN.");
//            internetActive = YES;
//            break;
//    }
//    
////    NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
////    switch (hostStatus)
////    
////    {
////        case NotReachable:
////        {
////            NSLog(@"A gateway to the host server is down.");
////            self.hostActive = NO;
////            
////            break;
////            
////        }
////        case ReachableViaWiFi:
////        {
////            NSLog(@"A gateway to the host server is working via WIFI.");
////            self.hostActive = YES;
////            
////            break;
////            
////        }
////        case ReachableViaWWAN:
////        {
////            NSLog(@"A gateway to the host server is working via WWAN.");
////            self.hostActive = YES;
////            
////            break;
////            
////        }
////    }
//}


//the send menu that pops up
- (IBAction)styleAction:(id)sender 
{
    counter = 1;
    
	UIActionSheet *styleAlert = [[UIActionSheet alloc] initWithTitle:nil
															delegate:self cancelButtonTitle:nil
											  destructiveButtonTitle:nil
												   otherButtonTitles: @"Google Search", @"E-mail", @"SMS", @",", @".", @"!",@"?", @"@", @"\"", @"'", @":", @";",@"(", @")",@"+",@"-", @"*", @"/", @"=",  @"_", @"#", @"%", @"$", @"&", @"<", @">", @"Ã", @"Follow Us On Facebook!", @"Email Support", @"Cancel", nil];
	
	// use the same style as the nav bar
	styleAlert.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
	
	[styleAlert showInView:self.mainview];
	[styleAlert release];
}

//handles what pressing each button on the pop-up menu does
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    // Change the navigation bar style, also make the status bar match with it
	switch (buttonIndex)
	{
//		case 0:
//		{
//			[[UIApplication sharedApplication] openURL:[NSURL URLWithString: [_egoTextView tutorialWeb]]];
//            [_egoTextView setEditable:NO];
//            [_egoTextView resignFirstResponder];
//			break;
//		}
		case 0:
		{
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString: [_egoTextView googleSearch]]];
            [_egoTextView setEditable:NO];
            [_egoTextView resignFirstResponder];
			break;
		}
			//		case 1:
			//		{
			//			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[_egoTextView yahooSearch]]];
			//			break;
			//		}
			//		case 2:
			//		{
			//			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[_egoTextView bingSearch]]];			
			//			break;
			//		}
		case 1:
		{
            [_egoTextView setEditable:NO];
			[_egoTextView resignFirstResponder];
			[self displayComposerSheet];
			break;
		}
		case 2:
		{
            [_egoTextView setEditable:NO];
			[_egoTextView resignFirstResponder];
			[self messageComposerSheet];
			break;
        }
		case 3:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@","];
            [_egoTextView setEditable:NO];
			break;
		}
		case 4:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"."];
            [_egoTextView setEditable:NO];
			break;
		}
		case 5:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"!"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 6:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"?"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 7:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"@"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 8:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"\""];
            [_egoTextView setEditable:NO];
			break;
		}
		case 9:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"'"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 10:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@":"];
            [_egoTextView setEditable:NO];
			break;
		}
        case 11:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@";"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 12:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"("];
            [_egoTextView setEditable:NO];
			break;
		}
		case 13:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@")"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 14:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"+"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 15:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"-"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 16:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"*"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 17:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"/"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 18:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"="];
            [_egoTextView setEditable:NO];
			break;
		}
		case 19:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"_"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 20:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"#"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 21:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"%"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 22:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"$"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 23:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"&"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 24:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"<"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 25:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@">"];
            [_egoTextView setEditable:NO];
			break;
		}
		case 26:
		{
			[_egoTextView setEditable:YES];
			[_egoTextView resignFirstResponder];
			[_egoTextView  insertText:@"Ã"];
            [_egoTextView setEditable:NO];
			break;
		}
        case 27:
		{
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString: [_egoTextView yahooSearch]]];
            [_egoTextView setEditable:NO];
            [_egoTextView resignFirstResponder];
			break;
		}
        case 28:
        {
            [_egoTextView setEditable:NO];
			[_egoTextView resignFirstResponder];
			[self displayComposer];
			break;
        }
        case 29:
        {
            [_egoTextView setEditable:NO];
			[_egoTextView resignFirstResponder];
            [actionSheet  dismissWithClickedButtonIndex:buttonIndex animated:YES];
            break;
        }
		default:
            [_egoTextView setEditable:NO];
            [_egoTextView resignFirstResponder];
            break;
	}
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
	//    {
	//    MainView *view = [[MainView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, self.view.bounds.size.height)];
	//    view.backgroundColor = [UIColor clearColor];
	//    [self.view addSubview:view];
	//    self.mainview = view;
	//    }
	//    
	//    return YES;
	//    return NO;
}


#pragma mark -
#pragma mark Actions
//
//- (void)segmentChanged:(UISegmentedControl*)sender {
//    
//    if (sender.selectedSegmentIndex == 0) {
//    
//        self.egoTextView.hidden = YES;
//        self.textView.hidden = NO;
//        [self.textView becomeFirstResponder];
//        
//    } else {
//        
//        self.textView.hidden = YES;
//        self.egoTextView.hidden = NO;
//        [self.egoTextView becomeFirstResponder];
//        
//    }
//    
//}


#pragma mark -
#pragma mark EGOTextViewDelegate

- (BOOL)egoTextViewShouldBeginEditing:(EGOTextView *)textView {
    return YES;
}

- (BOOL)egoTextViewShouldEndEditing:(EGOTextView *)textView {
    return YES;
}

- (void)egoTextViewDidBeginEditing:(EGOTextView *)textView {
}

- (void)egoTextViewDidEndEditing:(EGOTextView *)textView {
}

- (void)egoTextViewDidChange:(EGOTextView *)textView {
	
}

- (void)egoTextView:(EGOTextView*)textView didSelectURL:(NSURL *)URL {
    
    NSLog(@"SELECTED URL");
    
}


#pragma mark -
#pragma mark Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [_egoTextView release], _egoTextView=nil;
    [mainview release]; 
    [imageview release];
    state = 0;
    counter = 0;
    [two release];
    [three release];
    [four release];
    [five release];
    [six release];
    [seven release];
    [eight release];
    [nine release];
    [zero release];
    [one release];
    
    [c release];
    [k release];
    [a release];
    [d release];
    [f release];
    [s release];
    [b release];
    [e release];
    [g release];
    [x release];
    [y release];
    [m release];
    [n release];
    [p release];
    [q release];
    [r release];
    [i release];
    [j release];
    [l release];
    [u release];
    [o release];
    [h release];
    [t release];
    [v release];
    [w release];
    [z release];
}

- (void)dealloc {
    [_egoTextView release], _egoTextView=nil;
    [mainview release];
    [imageview release];
    state = 0;
    counter = 0;
    [two release];
    [three release];
    [four release];
    [five release];
    [six release];
    [seven release];
    [eight release];
    [nine release];
    [zero release];
    [one release];
    
    [c release];
	[k release];
    [a release];
    [d release];
	[f release];
	[s release];
	[b release];
	[e release];
	[g release];
	[x release];
	[y release];
	[m release];
	[n release];
	[p release];
	[q release];
	[r release];
	[i release];
	[j release];
	[l release];
	[u release];
	[o release];
	[h release];
	[t release];
	[v release];
	[w release];
	[z release];
    [super dealloc];
}

- (void)doCheckA: (A*) a
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"a"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"A"];
        [mainview resetView];
	}
}

- (void)doCheckB: (B*) b
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"b"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"B"];
        [mainview resetView];
	}
}

- (void)doCheckC: (C*) c
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"c"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"C"];
        [mainview resetView];
	}
}

- (void)doCheckD: (D*) d
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"d"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"D"];
        [mainview resetView];
	}
}

- (void)doCheckE: (E*) e
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"e"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"E"];
        [mainview resetView];
	}
}

- (void)doCheckF: (F*) f
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"f"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"F"];
        [mainview resetView];
	}
}

- (void)doCheckG: (G*) g
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"g"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"G"];
        [mainview resetView];
	}
}

- (void)doCheckH: (H*) h
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"h"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"H"];
        [mainview resetView];
	}
}

- (void)doCheckI: (I*) i
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"i"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"I"];
        [mainview resetView];
	}
}

- (void)doCheckJ: (J*) j
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"j"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"J"];
        [mainview resetView];
	}
}

- (void)doCheckK: (K*) k
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"k"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"K"];
        [mainview resetView];
	}
}

- (void)doCheckL: (L*) l
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"l"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"L"];
        [mainview resetView];
	}
}

- (void)doCheckM: (M*) m
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"m"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"M"];
        [mainview resetView];
	}
}

- (void)doCheckN: (N*) n
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"n"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"N"];
        [mainview resetView];
	}
}

- (void)doCheckO: (O*) o
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"o"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"O"];
        [mainview resetView];
	}
}

- (void)doCheckP: (P*) p
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"p"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"P"];
        [mainview resetView];
	}
}

- (void)doCheckQ: (Q*) q
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"q"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"Q"];
        [mainview resetView];
	}
}

- (void)doCheckR: (R*) r
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"r"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"R"];
        [mainview resetView];
	}
}

- (void)doCheckS: (S*) s
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"s"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"S"];
        [mainview resetView];
	}
}

- (void)doCheckT: (T*) t
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"t"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"T"];
        [mainview resetView];
	}
}

- (void)doCheckU: (U*) u
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"u"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"U"];
        [mainview resetView];
	}
}

- (void)doCheckV: (V*) v
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"v"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"V"];
        [mainview resetView];
	}
}

- (void)doCheckW: (W*) w
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"w"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"W"];
        [mainview resetView];
	}
}

- (void)doCheckX: (X*) x
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"x"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"X"];
        [mainview resetView];
	}
}

- (void)doCheckY: (Y*) y
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"y"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"Y"];
        [mainview resetView];
	}
}

- (void)doCheckZ: (Z*) z
{
    if (_egoTextView.editable == YES && state == 1)
    {
        [_egoTextView insertText:@"z"];
        [mainview resetView];
    }
	else if (_egoTextView.editable == YES && state == 2)
	{
		[_egoTextView insertText:@"Z"];
        [mainview resetView];
	}
}

- (void)doCheckTwo: (Two*) two
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"2"];
        [mainview resetView];
    }
}
- (void)doCheckThree: (Three*) three
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"3"];
        [mainview resetView];
    }
}

- (void)doCheckFour: (Four*) four
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"4"];
        [mainview resetView];
    }
}

- (void)doCheckFive: (Five*) five
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"5"];
        [mainview resetView];
    }
}
- (void)doCheckSix: (Six*) six
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"6"];
        [mainview resetView];
    }
}
- (void)doCheckSeven: (Seven*) seven
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"7"];
        [mainview resetView];
    }
}
- (void)doCheckEight: (Eight*) eight
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"8"];
        [mainview resetView];
    }
}

- (void)doCheckNine: (Nine*) nine
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"9"];
        [mainview resetView];
    }
}
- (void)doCheckZero: (Zero*) zero
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"0"];
        [mainview resetView];
    }
}
- (void)doCheckOne: (One*) one
{
    if (_egoTextView.editable == YES )
    {
        [_egoTextView insertText:@"1"];
        [mainview resetView];
    }
}


- (void)twotap:(UISwipeGestureRecognizer *)tap
{
//    if (_egoTextView.editable == YES)
//    {
//        [_egoTextView  insertText:@" "];    
//		[mainview resetView];
//    }
     [_egoTextView tap:tap];
    [mainview resetView];
    
    if (_egoTextView.editable == YES)
    {
    CGPoint location = [tap locationInView:self.view];
    [self showImageWithText:@"write" atPoint:location];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.65];
    imageview.alpha = 0.0;
    imageview.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];

        counter = 2;
    }
    
    else if (_egoTextView.editable == NO)
    {
        CGPoint location = [tap locationInView:self.view];
        [self showImageWithText:@"draw" atPoint:location];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.65];
        imageview.alpha = 0.0;
        imageview.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
        counter = 1;
    }
    
}

- (void)threetap:(UISwipeGestureRecognizer *)dtap
{
    if (_egoTextView.editable == YES)
    {
        [_egoTextView deleteBackward];    
		[mainview resetView];
        
//        CGPoint location = [dtap locationInView:self.view];
//        [self showImageWithText:@"del" atPoint:location];
//        
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.65];
//        imageview.alpha = 0.0;
//        imageview.transform = CGAffineTransformIdentity;
//        [UIView commitAnimations];
    }
}

- (void)doubletap:(UISwipeGestureRecognizer *)dswipe
{
    if (_egoTextView.editable == YES)
    {
        [_egoTextView insertText:@"\n"];
		[mainview resetView];
        
//        CGPoint location = [dswipe locationInView:self.view];
//        [self showImageWithText:@"ent" atPoint:location];
//        
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:0.65];
//        imageview.alpha = 0.0;
//        imageview.transform = CGAffineTransformIdentity;
//        [UIView commitAnimations];
    }   
}

- (void)tripletap:(UISwipeGestureRecognizer *)dswipe
{
    [mainview resetView];
}

- (void)doubleTap:(UITapGestureRecognizer*)gesture {
    counter = 1;
    [_egoTextView doubleTap:gesture]; 
	
}

- (void)tap:(UITapGestureRecognizer*)gesture {
    //[_egoTextView tap:gesture];
    if (_egoTextView.editable == YES)
    {
        [_egoTextView  insertText:@" "];    
		[mainview resetView];
    }
}

//- (void) space: (UITapGestureRecognizer*) gesture
//{
//    if (_egoTextView.editable == YES)
//    {
//        [_egoTextView  insertText:@" "];    
//		[mainview resetView];
//    }
//}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    [_egoTextView longPress:gesture];
}

- (void) linda:(UILongPressGestureRecognizer*)ges
{
    CGPoint location = [ges locationInView:self.view];
    [self showImageWithText:@"linda" atPoint:location];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:4];
    imageview.alpha = 0.0;
    imageview.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}

- (void)rotation:(UIRotationGestureRecognizer*) gesture
{
    if (state == 2)
    {
		// to numbers from uppercase || app open
        state = 3;
        
          [mainview resetView];
        
        [self.view removeGestureRecognizer:a];
        [self.view removeGestureRecognizer:b];
        [self.view removeGestureRecognizer:c];
        [self.view removeGestureRecognizer:d];
        [self.view removeGestureRecognizer:e];
        [self.view removeGestureRecognizer:f];
        [self.view removeGestureRecognizer:g];
        [self.view removeGestureRecognizer:h];
        [self.view removeGestureRecognizer:i];
        [self.view removeGestureRecognizer:j];
        [self.view removeGestureRecognizer:k];
        [self.view removeGestureRecognizer:l];
        [self.view removeGestureRecognizer:m];
        [self.view removeGestureRecognizer:n];
        [self.view removeGestureRecognizer:o];
        [self.view removeGestureRecognizer:p];
        [self.view removeGestureRecognizer:q];
        [self.view removeGestureRecognizer:r];
        [self.view removeGestureRecognizer:s];
        [self.view removeGestureRecognizer:t];
        [self.view removeGestureRecognizer:u];
        [self.view removeGestureRecognizer:v];
        [self.view removeGestureRecognizer:w];
        [self.view removeGestureRecognizer:x];
        [self.view removeGestureRecognizer:y];
        [self.view removeGestureRecognizer:z];
        
        [self.view addGestureRecognizer:two];
		[self.view addGestureRecognizer:three];
		[self.view addGestureRecognizer:four];
		[self.view addGestureRecognizer:five];
        [self.view addGestureRecognizer:six];
		[self.view addGestureRecognizer:seven];
		[self.view addGestureRecognizer:eight];
		[self.view addGestureRecognizer:nine];
		[self.view addGestureRecognizer:zero];
		[self.view addGestureRecognizer:one];
		
        CGPoint location = [gesture locationInView:self.view];
        [self showImageWithText:@"123" atPoint:location];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.65];
        imageview.alpha = 0.0;
        imageview.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
        
    }
	
    else if (state == 1)
    {
		// to uppercase from numbers
        state = 2;
        
	  [mainview resetView];
        
        CGPoint location = [gesture locationInView:self.view];
        [self showImageWithText:@"ABCBig" atPoint:location];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.65];
        imageview.alpha = 0.0;
        imageview.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
    }
	
	else if (state == 3)
	{
		// to lowercase from uppercase
		state = 1;
          [mainview resetView];
        
        [self.view removeGestureRecognizer:two];
		[self.view removeGestureRecognizer:three];
		[self.view removeGestureRecognizer:four];
		[self.view removeGestureRecognizer:five];
		[self.view removeGestureRecognizer:six];
		[self.view removeGestureRecognizer:seven];
		[self.view removeGestureRecognizer:eight];
		[self.view removeGestureRecognizer:nine];
		[self.view removeGestureRecognizer:zero];
		[self.view removeGestureRecognizer:one];
        
        
        [self.view addGestureRecognizer:c];
        [self.view addGestureRecognizer:k];
        [self.view addGestureRecognizer:a];
        [self.view addGestureRecognizer:d];
        [self.view addGestureRecognizer:f];
        [self.view addGestureRecognizer:s];
        [self.view addGestureRecognizer:b];
        [self.view addGestureRecognizer:e];
        [self.view addGestureRecognizer:g];
        [self.view addGestureRecognizer:x];
        [self.view addGestureRecognizer:y];
        [self.view addGestureRecognizer:m];
        [self.view addGestureRecognizer:n];
        [self.view addGestureRecognizer:p];
        [self.view addGestureRecognizer:q];
        [self.view addGestureRecognizer:r];
        [self.view addGestureRecognizer:i];
        [self.view addGestureRecognizer:j];
        [self.view addGestureRecognizer:l];
        [self.view addGestureRecognizer:u];
        [self.view addGestureRecognizer:o];
        [self.view addGestureRecognizer:h];
        [self.view addGestureRecognizer:t];
        [self.view addGestureRecognizer:v];
        [self.view addGestureRecognizer:w];
        [self.view addGestureRecognizer:z];
        
        CGPoint location = [gesture locationInView:self.view];
        
        //CGAffineTransform transform = CGAffineTransformMakeRotation([gesture rotation]);
        //  imageview.transform = transform;
        [self showImageWithText:@"abcsmall" atPoint:location];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.65];
        imageview.alpha = 0.0;
        imageview.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
	}
    
}

-  (void) fourtap:(UISwipeGestureRecognizer *)gesture
{
    [self.egoTextView fourtap:gesture];
    [mainview resetView];
}

- (void)showImageWithText:(NSString *)string atPoint:(CGPoint)centerPoint {
	
    /*
     Set the appropriate image for the image view, move the image view to the given point, then dispay it by setting its alpha to 1.0.
     */
	NSString *imageName = [string stringByAppendingString:@".png"];
	imageview.image = [UIImage imageNamed:imageName];
	imageview.center = centerPoint;
	imageview.alpha = 1.0;	
}



//email integration methods
-(void)displayComposerSheet 
{
	if([MFMailComposeViewController canSendMail] == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cannot send mail" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        
        /// Create an alert if connection doesn't work
        
        UIAlertView *myAlert = [[UIAlertView alloc]
                                
                                initWithTitle:@"Typasaurous"   message:@"The Email function needs Internet connection. If Internet connection is not available, the email will be sent at a later time."
                                
                                delegate:self
                                
                                cancelButtonTitle:@"OK"
                                
                                otherButtonTitles:nil];
        
        [myAlert show];
        
        [myAlert release];
    }
   
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	//[picker setSubject:@"Hello from California!"];
	
	// Fill out the email body text
	NSString *emailBody = [_egoTextView text];
	[picker setMessageBody:emailBody isHTML:NO];	
	[self presentModalViewController:picker animated:YES];
    [picker release];

}

-(void)displayComposer 
{
	if([MFMailComposeViewController canSendMail] == NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Cannot send mail" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)){
        
        /// Create an alert if connection doesn't work
        
        UIAlertView *myAlert = [[UIAlertView alloc]
                                
                                initWithTitle:@"Typasaurous"   message:@"The Email function needs Internet connection. If Internet connection is not available, the email will be sent at a later time."
                                
                                delegate:self
                                
                                cancelButtonTitle:@"OK"
                                
                                otherButtonTitles:nil];
        
        [myAlert show];
        
        [myAlert release];
    }
    
	MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
	picker.mailComposeDelegate = self;
	
	//[picker setSubject:@"Hello from California!"];
	
	// Fill out the email body text
    NSString*string = [[NSString alloc] initWithString:@"thesevonians@gmail.com"];
    NSArray *array = [[NSArray alloc] initWithObjects:string, nil];
	NSString *emailBody = [_egoTextView text];
    [picker setSubject:@"Typasaurous Support"];
    [picker setToRecipients:array];
	[picker setMessageBody:emailBody isHTML:NO];	
	[self presentModalViewController:picker animated:YES];
    
    [string release];
    [picker release];
    
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
    
    UIAlertView *badalert = [[UIAlertView alloc] initWithTitle:@"Typasaurous" message:@"E-mail Failed"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    UIAlertView *goodalert = [[UIAlertView alloc] initWithTitle:@"Typasaurous" message:@"Your E-mail has been sent!"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultFailed:
            [badalert show];
            break;
        case MFMailComposeResultSent:
            [goodalert show];
            break;
        default:
            break;
    }
    [badalert release];
    [goodalert release];
	[self dismissModalViewControllerAnimated:YES];
}



//
//SMS integration methods
-(void)messageComposerSheet 
{
	MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
	picker.messageComposeDelegate = self;
	if ([MFMessageComposeViewController canSendText] == YES) {
		//picker.recipients = [NSArray arrayWithObject:@"123456789"]; //test with intended recipients
		picker.body = [_egoTextView text];
		
		[self presentModalViewController:picker animated:YES];
	}
    [picker release];
}


// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)messageComposeController:(MFMessageComposeViewController*)controller didFinishWithResult:(MessageComposeResult)result error:(NSError*)error 
{	
	[self dismissModalViewControllerAnimated:YES];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
     UIAlertView *badalert = [[UIAlertView alloc] initWithTitle:@"Typasaurous" message:@"Message Failed"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    UIAlertView *goodalert = [[UIAlertView alloc] initWithTitle:@"Typasaurous" message:@"Your message has been sent!"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
	    switch (result)
	  {
	            case MessageComposeResultCancelled:
                    NSLog(@"Cancelled");
	                break;
	            case MessageComposeResultFailed:
	                [badalert show];
	                break;
	            case MessageComposeResultSent:
                    [goodalert show];
	                break;
	            default:
	                break;
	   }
    
    [goodalert release];
    [badalert release];
    [self dismissModalViewControllerAnimated:YES];
}
//end e-mail stuff



//- (void)singletap:(UISwipeGestureRecognizer *)stap
//{
////    // if (![self isFirstResponder]) { 
////    // Inform controller that we're about to enter editing mode
////    [self._egoTextView tap:stap];
//  //   [mainview resetView];
////    //}
//    
//    [self.protocol _egoTextViewWillEdit:_egoTextView];
//    // Flag that underlying SimpleCoreTextView is now in edit mode
//    _egoTextView.editable = YES;
//      [mainview resetView];
//}


@end

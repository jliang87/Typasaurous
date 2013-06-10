#import "FirstViewController.h"

@implementation FirstViewController 

@synthesize myWebView;
@synthesize activityIndicator;
@synthesize navBar;

- (void)viewDidLoad { //We have a NIB file in play here, so I dropped the loadView here.  Just make sure that your loadView is not getting called twice!
    [super viewDidLoad];
    [self loadView];
}


- (void)button
{
//	switch (button) 
//	{
//		case 1: 
			[self dismissModalViewControllerAnimated:YES];
		//	break;
	
}

- (void)loadView {
	contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	self.view = contentView;	
	
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y = 40.0f;
	myWebView = [[UIWebView alloc] initWithFrame:webFrame];
	myWebView.backgroundColor = [UIColor colorWithRed:.05 green:.05 blue:0.15 alpha:1];
	myWebView.scalesPageToFit = YES;
	myWebView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	myWebView.delegate = self;
	[self.view addSubview: myWebView];
	[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.sfu.ca/~crng/tutorial.pdf"]]];
	
	activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
	activityIndicator.center = self.view.center;
	[self.view addSubview: activityIndicator];
    
//    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:self];
//    navController.navigationBar.topItem.title = @"Typasaurous";
//    navController.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    self.myWebView.window.rootViewController = navController;
//    
//
//    [navController release];
    

	
	//Setup navigation var
	navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 40.0f)];
	
	navBar.barStyle = UIBarStyleBlack; // This sets the color and look of the navigation bar.];
	[navBar setDelegate:self];
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:@"Tutorial"];
	[navBar pushNavigationItem:item animated:YES];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle: @"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(button)];
    item.leftBarButtonItem = rightButton;
   // item.hidesBackButton = YES;
    [rightButton release];
    [item release];
	[self.view addSubview:navBar];
	
}



- (void)dealloc {
	[activityIndicator release];
    [contentView release];
	[myWebView release];
    [navBar release];
	[super dealloc];
}

#pragma mark WEBVIEW Methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><br /><br /><font size=+5 color='red'>Error<br /><br />Your request %@</font></center></html>",
							 error.localizedDescription];
	[myWebView loadHTMLString:errorString baseURL:nil];
}

@end
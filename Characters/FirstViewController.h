#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIWebViewDelegate>
{
	UIWebView *myWebView;
	UIActivityIndicatorView *activityIndicator;	
	UIView *contentView;
	UINavigationBar* navBar;
   // UIWindow *window;
}

@property (nonatomic, retain) UIWebView	*myWebView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UINavigationBar *navBar;

@end
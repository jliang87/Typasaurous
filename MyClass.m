#import "MyClass.h"


@implementation MainView

@synthesize color; // generate getters and setters for color
@synthesize lineWidth; // generate getters and setters for lineWidth

// method is called when the view is created in a nib file
- (id)initWithFrame:(CGRect)frame
{
    // if the superclass initializes properly
    if ((self = [super initWithFrame:frame]))
    {
        // initialize squiggles and finishedSquiggles
        squiggles = [[NSMutableDictionary alloc] init];
        finishedSquiggles = [[NSMutableArray alloc] init];
        
        // the starting color is black
        color = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:.7];
        lineWidth = 5;
        //        self.backgroundColor = [UIColor clearColor];
        //        self.opaque = NO;// default line width
    } // end if
    
    return self; // return this object
} // end method initWithCoder:

// clears all the drawings
- (void)resetView
{
    [squiggles removeAllObjects]; // clear the dictionary of squiggles
    [finishedSquiggles removeAllObjects]; // clear the array of squiggles
    [self setNeedsDisplay]; // refresh the display
} // end method resetView

// draw the view
- (void)drawRect:(CGRect)rect
{   
    // get the current graphics context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw all the finished squiggles
    for (Squiggle *squiggle in finishedSquiggles)
        [self drawSquiggle:squiggle inContext:context];
    
    // draw all the squiggles currently in progress
    for (NSString *key in squiggles)
    {
        Squiggle *squiggle = [squiggles valueForKey:key]; // get squiggle
        [self drawSquiggle:squiggle inContext:context]; // draw squiggle
    } // end for
} // end method drawRect:

// draws the given squiggle into the given context
- (void)drawSquiggle:(Squiggle *)squiggle inContext:(CGContextRef)context
{
    // set the drawing color to the squiggle's color
    UIColor *squiggleColor = squiggle.strokeColor; // get squiggle's color
    CGColorRef colorRef = [squiggleColor CGColor]; // get the CGColor
    CGContextSetStrokeColorWithColor(context, colorRef);
    
    // set the line width to the squiggle's line width
    CGContextSetLineWidth(context, squiggle.lineWidth);
    
    NSMutableArray *points = [squiggle points]; // get points from squiggle
    
    // retrieve the NSValue object and store the value in firstPoint
    CGPoint firstPoint; // declare a CGPoint
    [[points objectAtIndex:0] getValue:&firstPoint];
    
    // move to the point
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    
    // draw a line from each point to the next in order
    for (int i = 1; i < [points count]; i++)
    {
        NSValue *value = [points objectAtIndex:i]; // get the next value
        CGPoint point; // declare a new point
        [value getValue:&point]; // store the value in point
        
        // draw a line to the new point
        CGContextAddLineToPoint(context, point.x, point.y);
    } // end for
    
    CGContextStrokePath(context);   
} // end method drawSquiggle:inContext:

// called whenever the user places a finger on the screen
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSArray *array = [touches allObjects]; // get all the new touches
    
    // loop through each new touch
    for (UITouch *touch in array)
    {
        // create and configure a new squiggle
        Squiggle *squiggle = [[Squiggle alloc] init];
        [squiggle setStrokeColor:color]; // set squiggle's stroke color
        [squiggle setLineWidth:lineWidth]; // set squiggle's line width
        
        // add the location of the first touch to the squiggle
        [squiggle addPoint:[touch locationInView:self]];
        
        // the key for each touch is the value of the pointer
        NSValue *touchValue = [NSValue valueWithPointer:touch];
        NSString *key = [NSString stringWithFormat:@"%@", touchValue];
        
        // add the new touch to the dictionary under a unique key
        [squiggles setValue:squiggle forKey:key];
        [squiggle release]; // we are done with squiggle so release it
    } // end for
} // end method touchesBegan:withEvent:

// called whenever the user drags a finger on the screen
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *array = [touches allObjects]; // get all the moved touches
    
    // loop through all the touches
    for (UITouch *touch in array)
    {
        // get the unique key for this touch
        NSValue *touchValue = [NSValue valueWithPointer:touch];
        
        // fetch the squiggle this touch should be added to using the key
        Squiggle *squiggle = [squiggles valueForKey:
                              [NSString stringWithFormat:@"%@", touchValue]];
        
        // get the current and previous touch locations
        CGPoint current = [touch locationInView:self];
        CGPoint previous = [touch previousLocationInView:self];
        [squiggle addPoint:current]; // add the new point to the squiggle
        
        // Create two points: one with the smaller x and y values and one
        // with the larger. This is used to determine exactly where on the
        // screen needs to be redrawn.
        CGPoint lower, higher;
        lower.x = (previous.x > current.x ? current.x : previous.x);
        lower.y = (previous.y > current.y ? current.y : previous.y);
        higher.x = (previous.x < current.x ? current.x : previous.x);
        higher.y = (previous.y < current.y ? current.y : previous.y);
        
        // redraw the screen in the required region
        [self setNeedsDisplayInRect:CGRectMake(lower.x-lineWidth,
                                               lower.y-lineWidth, higher.x - lower.x + lineWidth*2,
                                               higher.y - lower.y + lineWidth*2)];
    } // end for
} // end method touchesMoved:withEvent:

// called when the user lifts a finger from the screen
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // loop through the touches
    for (UITouch *touch in touches)
    {
        // get the unique key for the touch
        NSValue *touchValue = [NSValue valueWithPointer:touch];
        NSString *key = [NSString stringWithFormat:@"%@", touchValue];
        
        // retrieve the squiggle for this touch using the key
        Squiggle *squiggle = [squiggles valueForKey:key];
        
        // remove the squiggle from the dictionary and place it in an array
        // of finished squiggles
        if (squiggle != nil)
        {        [finishedSquiggles addObject:squiggle]; // add to finishedSquiggles
            [squiggles removeObjectForKey:key]; // remove from squiggles
        }
    } // end for   
} // end method touchesEnded:withEvent:

// called when a motion event, such as a shake, ends
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    // if a shake event ended
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        // create an alert prompting the user about clearing the painting
        NSString *message = @"Are you sure you want to clear the painting?";
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:
                              @"Clear painting" message:message delegate:self
                                              cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear", nil];
        [alert show]; // show the alert
        [alert release]; // release the alert UIAlertView
    } // end if
    
    // call the superclass's moetionEnded:withEvent: method
    [super motionEnded:motion withEvent:event];
} // end method motionEnded:withEvent:

// clear the painting if the user touched the "Clear" button
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:
(NSInteger)buttonIndex
{
    // if the user touched the Clear button
    if (buttonIndex == 1)
        [self resetView]; // clear the screen
} // end method alertView:clickedButtonAtIndex:

// determines if this view can become the first responder
- (BOOL)canBecomeFirstResponder
{
    return YES; // this view can be the first responder
} // end method canBecomeFirstResponder

// free MainView's memory
- (void)dealloc
{
    [squiggles release]; // release the squiggles NSMutableDictionary
    [finishedSquiggles release]; // release finishedSquiggles
    [color release]; // release the color UIColor
    [super dealloc];
} // end method dealloc
@end


// Squiggle.m
// Squiggle class implementation.
#import "Squiggle.h"

@implementation Squiggle

@synthesize strokeColor; // generate set and get methods for strokeColor
@synthesize lineWidth; // generate set and get methods for lineWidth
@synthesize points; // generate set and get methods for points

// initialize the Squiggle object
- (id)init
{
   // if the superclass properly initializes
   if ((self = [super init]))
   {
      points = [[NSMutableArray alloc] init]; // initialize points
      strokeColor = [[UIColor blackColor] retain]; // set default color
   } // end if
   
   return self; // return this object
} // end method init

// add a new point to the Squiggle
- (void)addPoint:(CGPoint)point
{
   // encode the point in an NSValue so we can put it in an NSArray
   NSValue *value =
      [NSValue valueWithBytes:&point objCType:@encode(CGPoint)];
   [points addObject:value]; // add the encoded point to the NSArray
} // end method addPoint:

// release Squiggle's memory
- (void)dealloc
{
   [strokeColor release]; // release the strokeColor UIColor
   [points release]; // release the points NSMutableArray
   [super dealloc];
} // end method dealloc
@end

/**************************************************************************
 * (C) Copyright 2010 by Deitel & Associates, Inc. All Rights Reserved.   *
 *                                                                        *
 * DISCLAIMER: The authors and publisher of this book have used their     *
 * best efforts in preparing the book. These efforts include the          *
 * development, research, and testing of the theories and programs        *
 * to determine their effectiveness. The authors and publisher make       *
 * no warranty of any kind, expressed or implied, with regard to these    *
 * programs or to the documentation contained in these books. The authors *
 * and publisher shall not be liable in any event for incidental or       *
 * consequential damages in connection with, or arising out of, the       *
 * furnishing, performance, or use of these programs.                     *
 *                                                                        *
 * As a user of the book, Deitel & Associates, Inc. grants you the        *
 * nonexclusive right to copy, distribute, display the code, and create   *
 * derivative apps based on the code for noncommercial purposes only--so  *
 * long as you attribute the code to Deitel & Associates, Inc. and        *
 * reference www.deitel.com/books/iPhoneFP/. If you have any questions,   *
 * or specifically would like to use our code for commercial purposes,    *
 * contact deitel@deitel.com.                                             *
 *************************************************************************/


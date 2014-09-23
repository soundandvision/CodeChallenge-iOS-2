//
//  NSDate+Utilities.h
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/14/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//
//  Date Formats are described here: http://unicode.org/reports/tr35/tr35-10.html#Date_Format_Patterns
//
//  Samples:
//
//  EEEE, MMMM d - h:mm a
//  Thursday, August 2 - 3:45 PM
//
//  yyyy-MM-ddThh:mm:ss
//  2013-07-26T19:05:00
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilities)

- (NSDate *)dateByStrippingTimeComponents;
- (NSString *)stringFromDateFormat:(NSString *)dateFormat;
- (NSString *)stringWithFullStyle;
- (BOOL)isInThePast;

@end

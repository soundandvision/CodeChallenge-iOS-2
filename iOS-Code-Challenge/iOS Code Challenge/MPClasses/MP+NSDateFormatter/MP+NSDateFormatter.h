//
//  NSDateFormatter+Utilities.h
//  DRYV
//
//  Created by Jeffrey Camealy on 5/13/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Utilities)

/**
 * Returns a date based on a common format.
 *
 * formatter.dateFormat = @"M/d/yyyy h:mm a"
 * ex: @"8/23/1985 3:45 PM"
 *
 */
+ (NSDate *)dateWithCommonFormatString:(NSString *)dateString;

@end

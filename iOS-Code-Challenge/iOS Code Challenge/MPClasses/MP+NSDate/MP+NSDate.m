//
//  NSDate+Utilities.m
//  Dryv-DryCleaners
//
//  Created by Jeffrey Camealy on 4/14/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "MP+NSDate.h"

@implementation NSDate (Utilities)

- (NSDate *)dateByStrippingTimeComponents {
    NSString *dateString = [self stringFromDateFormat:@"yyyy-MM-dd 00:00:00 +0000"];
    NSDateFormatter *formatter = NSDateFormatter.new;
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss ZZZ";
    return [formatter dateFromString:dateString];
}

- (NSString *)stringFromDateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = NSDateFormatter.new;
    [formatter setDateFormat:dateFormat];
    formatter.timeZone = [NSTimeZone localTimeZone];
    return [formatter stringFromDate:self];
}

- (NSString *)stringWithFullStyle {
    NSDateFormatter *dateFormatter = NSDateFormatter.new;
    dateFormatter.dateStyle = NSDateFormatterFullStyle;
    return [dateFormatter stringFromDate:self];
}

- (BOOL)isInThePast {
    NSTimeInterval timeTillDate = [self timeIntervalSinceDate:NSDate.date];
    return (timeTillDate < 0);
}

@end

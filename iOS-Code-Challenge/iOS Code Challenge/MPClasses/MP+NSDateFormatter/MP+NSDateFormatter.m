//
//  NSDateFormatter+Utilities.m
//  DRYV
//
//  Created by Jeffrey Camealy on 5/13/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "MP+NSDateFormatter.h"

@implementation NSDateFormatter (Utilities)

+ (NSDate *)dateWithCommonFormatString:(NSString *)dateString {
    NSDateFormatter *formatter = NSDateFormatter.new;
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter dateFromString:dateString];
}

@end

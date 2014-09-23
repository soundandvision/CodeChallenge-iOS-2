//
//  NSDictionaryNullfix.m
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MPDictionary)
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;
@end


@interface NSMutableDictionary (MPDictionary)
- (NSMutableDictionary *)dictionaryByReplacingNullsWithStrings;
@end

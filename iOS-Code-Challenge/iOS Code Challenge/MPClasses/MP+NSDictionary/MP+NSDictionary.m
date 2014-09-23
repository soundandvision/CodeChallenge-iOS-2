//
//  NSDictionaryNullfix.m
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import "MP+NSDictionary.h"

@implementation NSDictionary (MPDictionary)

- (NSDictionary*)dictionaryByReplacingNullsWithStrings {
    NSMutableDictionary*dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    for (NSString * key in [dictionary allKeys])
    {
        if([[dictionary objectForKey:key]isKindOfClass:[NSArray class]]){
            NSMutableArray*newArray = [[NSMutableArray alloc]init];
            for(int i=0;i<[[dictionary objectForKey:key]count];i++){
                if([[[dictionary objectForKey:key]objectAtIndex:i]isKindOfClass:[NSDictionary class]])
                    [newArray addObject:[[[dictionary objectForKey:key]objectAtIndex:i]dictionaryByReplacingNullsWithStrings]];
                else
                    [newArray addObject:[[dictionary objectForKey:key]objectAtIndex:i]];
            }
            [dictionary setObject:newArray forKey:key];
        }else if([[dictionary objectForKey:key]isKindOfClass:[NSDictionary class]]){
            [dictionary setObject:[dictionary[key]dictionaryByReplacingNullsWithStrings] forKey:key];
        }else if([[dictionary objectForKey:key]isKindOfClass:[NSNull class]]){
            [dictionary setObject:@"" forKey:key];
        }
    }
    return dictionary.copy;
}

@end

@implementation NSMutableDictionary (MPDictionary)

- (NSMutableDictionary*)dictionaryByReplacingNullsWithStrings {
    NSMutableDictionary*dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    for (NSString * key in [dictionary allKeys])
    {
        if([[dictionary objectForKey:key]isKindOfClass:[NSArray class]]){
            NSMutableArray*newArray = [[NSMutableArray alloc]init];
            for(int i=0;i<[[dictionary objectForKey:key]count];i++){
                if([[[dictionary objectForKey:key]objectAtIndex:i]isKindOfClass:[NSDictionary class]])
                    [newArray addObject:[[[dictionary objectForKey:key]objectAtIndex:i]dictionaryByReplacingNullsWithStrings]];
                else
                    [newArray addObject:[[dictionary objectForKey:key]objectAtIndex:i]];
            }
            [dictionary setObject:newArray forKey:key];
        }else if([[dictionary objectForKey:key]isKindOfClass:[NSDictionary class]]){
            [dictionary setObject:[dictionary[key]dictionaryByReplacingNullsWithStrings] forKey:key];
        }else if([[dictionary objectForKey:key]isKindOfClass:[NSNull class]]){
            [dictionary setObject:@"" forKey:key];
        }
    }
    return dictionary.mutableCopy;
}

@end
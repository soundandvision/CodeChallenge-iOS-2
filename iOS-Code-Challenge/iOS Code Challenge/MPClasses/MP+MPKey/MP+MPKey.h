//
//  NSDictionaryNullfix.m
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import <Foundation/Foundation.h>

static char keyKey;
static char attachmentKey;

@interface NSObject (MPKey)
- (void)setKey:(NSString*)key;
- (NSString*)key;

- (void)setAttachment:(id)attachment;
- (id)attachment;

@end

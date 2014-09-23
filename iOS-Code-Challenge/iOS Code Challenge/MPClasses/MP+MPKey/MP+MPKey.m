//
//  NSDictionaryNullfix.m
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import "MP+MPKey.h"
#import <objc/runtime.h>

@implementation NSObject (MPKey)

- (void)setKey:(NSString*)key {
    objc_setAssociatedObject(self, &keyKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*)key {
    return (NSString*)objc_getAssociatedObject(self, &keyKey);
}

- (void)setAttachment:(id)attachment {
    objc_setAssociatedObject(self, &attachmentKey, attachment, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)attachment {
    return objc_getAssociatedObject(self, &attachmentKey);
}

@end

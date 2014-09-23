//
//  NSDictionaryNullfix.m
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import "MP+UITextField.h"
#import <objc/runtime.h>

static char placeholderColorKey;

@implementation UITextField (MPTextField)

- (void)setPlaceholderColor:(UIColor*)color {
    objc_setAssociatedObject(self, &placeholderColorKey, color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setPlaceholder:self.placeholder];
}

- (void)setPlaceholder:(NSString *)placeholder {
    UIColor*placeholderColor = objc_getAssociatedObject(self, &placeholderColorKey);
    if(placeholderColor!=NULL&&placeholder!=NULL){
        [self setAttributedPlaceholder:[[NSAttributedString alloc]initWithString:placeholder attributes:@{NSForegroundColorAttributeName:placeholderColor}]];
    }
}

@end

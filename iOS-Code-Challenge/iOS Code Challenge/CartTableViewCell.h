//
//  CartTableViewCell.h
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/16/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKMenuItem;

@interface CartTableViewCell : UITableViewCell

- (void)setItem:(CKMenuItem*)item;

@end

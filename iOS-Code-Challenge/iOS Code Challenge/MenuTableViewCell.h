//
//  MenuTableViewCell.h
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell

- (void)setImageWithURL:(NSURL*)url;
- (void)setTitle:(NSString*)title;
- (void)setPrice:(float)price;

@end

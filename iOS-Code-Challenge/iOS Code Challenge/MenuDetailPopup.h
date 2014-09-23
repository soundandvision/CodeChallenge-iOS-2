//
//  MenuDetailPopup.h
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/16/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CKMenuItem;

@protocol MenuDetailPopupDelegate <NSObject>
- (void)menuPopup_updateItem:(CKMenuItem*)menuItem withQuantity:(int)quantity;
@end

@interface MenuDetailPopup : UIView

- (id)initWithMenuItem:(CKMenuItem*)menuItem parentViewController:(UIViewController*)parent delegate:(id<MenuDetailPopupDelegate>)delegate;

- (void)show;
- (void)hide;

@property(nonatomic,retain) id<MenuDetailPopupDelegate> delegate;

@end

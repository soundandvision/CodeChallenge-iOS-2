//
//  CookieKit.h
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CKUser.h"
#import "CKMenuItem.h"

@protocol CookieKitDelegate <NSObject>
@optional
- (void)cookieKit_loginSuccessful;

- (void)cookieKit_syncedMenu;
- (void)cookieKit_syncedBasket;
@end

@protocol CookieKitAlertsDelegate <NSObject>
- (void)cookieKit_showAlertWithTitle:(NSString*)title body:(NSString*)body;
@end

@interface CookieKit : NSObject

+ (instancetype)shared;
- (void)addDelegate:(id<CookieKitDelegate>)newDelegate;
- (void)removeDelegate:(id<CookieKitDelegate>)oldDelegate;

- (void)user_loginWithUsername:(NSString*)username password:(NSString*)password;

- (NSArray*)menu;
- (void)menu_refresh;

- (NSArray*)basket;
- (int)basket_quantityForItem:(CKMenuItem*)cookie;
- (void)basket_reserve:(CKMenuItem*)cookie quantity:(int)quantity;
- (void)basket_reset;
- (float)basket_total;
- (float)basket_shipping;

@property(nonatomic,retain) id<CookieKitAlertsDelegate> alertsDelegate;

@end

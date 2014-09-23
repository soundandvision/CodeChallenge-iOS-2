//
//  CookieKit.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CookieKit.h"
//#import "AFNetworking.h"

@interface CookieKit ()
{
    NSMutableSet*_delegates;
    
}
@end

@implementation CookieKit

@synthesize alertsDelegate = _alertsDelegate;

- (id)init {
    if(self = [super init]){
        _delegates = [NSMutableSet new];
        
        //API BASE URL: http://codechallenge.orainteractive.com/
        //ALL CALLS [EXCEPT LOGIN] REQUIRE: token,basket_token
        
        //example delegate call: [self delegate:@selector(cookieKit_syncedBasket)];
        
        
    } return self;
}

+ (instancetype)shared {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

#pragma mark - Login

- (void)user_loginWithUsername:(NSString *)username password:(NSString *)password {
    //LOGIN
    //ENDPOINT: Cart/Reserve
    //PARAMS: item_id,quantity
#warning INCOMPLETE IMPLEMENTATION
}

#pragma mark - Menu

- (NSArray*)menu {
    // RETURN THE CURRENT MENU ITEMS AS AN ARRAY
#warning INCOMPLETE IMPLEMENTATION
    return @[];
}

- (void)menu_refresh {
    // SYNC THE MENU
#warning INCOMPLETE IMPLEMENTATION
}

#pragma mark - Basket

- (NSArray*)basket {
    // RETURN THE CURRENT BASKET ITEMS AS AN ARRAY
#warning INCOMPLETE IMPLEMENTATION
    return @[];
}

- (int)basket_quantityForItem:(CKMenuItem*)cookie {
    // RETURN THE CURRENT BASKET QUANTITY FOR A GIVEN ITEM
#warning INCOMPLETE IMPLEMENTATION
    return 0;
}

- (void)basket_sync {
    //SYNC BASKET
    //ENDPOINT: Cart
#warning INCOMPLETE IMPLEMENTATION
}

- (void)basket_reserve:(CKMenuItem*)cookie quantity:(int)quantity {
    //RESERVE OR UPDATE BASKET ITEM
    //ENDPOINT: Cart/Reserve
    //PARAMS: item_id,quantity
#warning INCOMPLETE IMPLEMENTATION
}

- (void)basket_reset {
    //RESET THE BASKET
    //ENDPOINT: Cart/Empty
#warning INCOMPLETE IMPLEMENTATION
}

- (void)basket_updateWithResponse:(NSDictionary*)basket {
    //PROCESS UPDATED BASKET
#warning INCOMPLETE IMPLEMENTATION
}

- (float)basket_total {
    //RETURN THE CURRENT BASKET TOTAL PRICE
#warning INCOMPLETE IMPLEMENTATION
    return 0;
}

- (float)basket_shipping {
    //RETURN THE CURRENT BASKET SHIPPING COST
#warning INCOMPLETE IMPLEMENTATION
    return 0;
}

#pragma mark - API Methods

/*- (void)api_processError:(AFHTTPRequestOperation*)operation error:(NSError*)error showWarning:(BOOL)warning {
    //API ERROR
    //RESPONSE CONTAINS: title, body
    //LOG TO CONSOLE:
    //- NSERROR
    //- REQUEST BODY
    //- RESPONSE BODY*/ //(commented to prevent compilation error)
#warning INCOMPLETE IMPLEMENTATION
//}

#pragma mark - CookieKitDelegate Methods

- (void)addDelegate:(id<CookieKitDelegate>)newDelegate {
    [_delegates addObject:newDelegate];
}

- (void)removeDelegate:(id<CookieKitDelegate>)oldDelegate {
    [_delegates addObject:oldDelegate];
}

- (void)delegate:(SEL)selector {
    for(id delegate in _delegates.copy)
        if([delegate respondsToSelector:selector])
            ((void (*)(id, SEL))[delegate methodForSelector:selector])(delegate, selector);
}

#pragma mark - CookieKitAlertsDelegate Methods

- (void)cookieKit_showAlertWithTitle:(NSString*)title body:(NSString*)body {
#warning INCOMPLETE IMPLEMENTATION
}



@end

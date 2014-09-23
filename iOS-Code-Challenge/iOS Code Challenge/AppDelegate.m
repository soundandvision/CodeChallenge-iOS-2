//
//  AppDelegate.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MenuViewController.h"
#import "CookieKit.h"

//* FONTS *//

//OpenSans-Light
//OpenSans
//OpenSans-Bold

@interface AppDelegate () <CookieKitAlertsDelegate>
{
    
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [self.window setRootViewController:[MainViewController sharedInstance]];
    [[MainViewController navigationController]setViewControllers:@[[MenuViewController new]]];
    
    [[CookieKit shared]setAlertsDelegate:self];
#warning CALL CookieKit LOGIN METHOD HERE
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)cookieKit_showAlertWithTitle:(NSString *)title body:(NSString *)body {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end

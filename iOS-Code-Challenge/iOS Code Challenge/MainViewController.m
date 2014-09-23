//
//  MainViewController.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "MainViewController.h"
#import "MPClasses.h"

#import "CartViewController.h"

@interface MainViewController ()
{
    CGRect frame;
    
}
@end

@implementation MainViewController
@synthesize navigationController = _navigationController;

#pragma mark - Life Cycle

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

- (id)init {
    if(self = [super init]){
        _navigationController = [UINavigationController new];
    } return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColorFromRGB(0x22c064)] forBarMetrics:UIBarMetricsDefault];
    
    [_navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"OpenSans" size:17.0],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    [_navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIView*cartBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 70, 40)];
    [cartBtnView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nav-basket"]]];
    
    UIBarButtonItem *cartBtn = [[UIBarButtonItem alloc]initWithCustomView:cartBtnView];
    [_navigationController.topViewController.navigationItem setRightBarButtonItem:cartBtn];
    
    UITapGestureRecognizer*cartTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openCart)];
    [cartTap setNumberOfTapsRequired:1];
    [cartBtnView addGestureRecognizer:cartTap];
    
    [self.view addSubview:_navigationController.view];
    [self.view setBackgroundColor:UIColorFromRGB(0x000000)];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    if(!CGRectEqualToRect(self.view.bounds, frame)){
        [self resizeViews];
    }
    
}

- (void)resizeViews {
    frame = self.view.bounds;
    [_navigationController.view setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
}

+ (UINavigationController*)navigationController {
    return [[MainViewController sharedInstance]navigationController];
}

- (void)openCart {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  CartViewController.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/16/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CartViewController.h"
#import "MPClasses.h"
#import "CookieKit.h"

#import "CartTableViewCell.h"

@interface CartViewController () <UITableViewDataSource,UITableViewDelegate,CookieKitDelegate>
{
    CGRect frame;
    
    UITableView*cartTableView;
    
    UIView*checkoutView;
    UILabel*checkoutTotalLbl;
    UILabel*payNowBtn;
    UIButton*checkoutBtn;
    
    NSArray*cart;
}
@end

@implementation CartViewController

- (id)init {
    if(self = [super init]){
        checkoutTotalLbl = [UILabel new];
    } return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[CookieKit shared]addDelegate:self];
    
    [self.navigationItem setTitle:@"My Basket"];
    
    cartTableView = [UITableView new];
    [cartTableView setDataSource:self];
    [cartTableView setDelegate:self];
    [cartTableView setBackgroundColor:UIColorFromRGB(0x1c1c1c)];
    [cartTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [cartTableView setSeparatorColor:UIColorFromRGB(0x0d0d0d)];
    [self.view addSubview:cartTableView];
    
    checkoutView = [UIView new];
    [checkoutView setBackgroundColor:UIColorFromRGB(0x22c064)];
    [self.view addSubview:checkoutView];
    
    [checkoutTotalLbl setTextAlignment:NSTextAlignmentCenter];
    [checkoutTotalLbl setFont:[UIFont fontWithName:@"OpenSans-Bold" size:25.0]];
    [checkoutTotalLbl setBackgroundColor:[UIColor clearColor]];
    [checkoutTotalLbl setTextColor:[UIColor whiteColor]];
    [checkoutView addSubview:checkoutTotalLbl];
 
    checkoutBtn = [UIButton new];
    [checkoutBtn addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
    [checkoutBtn setBackgroundColor:[UIColor clearColor]];
    [checkoutView addSubview:checkoutBtn];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[CookieKit shared]addDelegate:self];
    [self reloadCart];
    
    if(!CGRectEqualToRect(self.view.bounds, frame)){
        [self resizeViews];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[CookieKit shared]removeDelegate:self];
}

- (void)resizeViews {
    frame = self.view.bounds;
    
    [checkoutView setFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    [checkoutTotalLbl setFrame:CGRectMake(10, 0, checkoutView.frame.size.width-20, checkoutView.frame.size.height)];
    [checkoutBtn setFrame:CGRectMake(0, 0, checkoutView.frame.size.width, checkoutView.frame.size.height)];
    
    [cartTableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-checkoutView.frame.size.height)];
}

- (void)cookieKit_syncedBasket {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)reloadCart {
    
    [checkoutTotalLbl setText:[NSString stringWithFormat:@"Pay Now - $%0.02f",[[CookieKit shared]basket_total]]];
    
    cart = [[CookieKit shared]basket];
    [cartTableView reloadData];
}

#warning IMPLEMENT UITABLEVIEW DELEGATES

- (void)pay {
    [[CookieKit shared]basket_reset];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

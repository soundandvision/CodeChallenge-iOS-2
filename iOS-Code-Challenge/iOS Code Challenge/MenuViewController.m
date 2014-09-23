//
//  MenuViewController.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "MenuViewController.h"
#import "CookieKit.h"
#import "MPClasses.h"
#import "MenuTableViewCell.h"

#import "MenuDetailPopup.h"

@interface MenuViewController () <CookieKitDelegate,UITableViewDataSource,UITableViewDelegate,MenuDetailPopupDelegate>
{
    CGRect frame;
    
    UITableView*menuTableView;
    UIRefreshControl*refreshControl;
    
    NSArray*pageContent;
    
    MenuDetailPopup*currentPopup;
}
@end

@implementation MenuViewController

#pragma mark - Life Cycle

- (id)init {
    if(self = [super init]){
        
    } return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    menuTableView = [UITableView new];
    [menuTableView setDataSource:self];
    [menuTableView setDelegate:self];
    [menuTableView setBackgroundColor:UIColorFromRGB(0x1c1c1c)];
    [menuTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [menuTableView setSeparatorColor:UIColorFromRGB(0x0d0d0d)];
    [self.view addSubview:menuTableView];

    refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:[CookieKit shared] action:@selector(menu_refresh) forControlEvents:UIControlEventValueChanged];
    [menuTableView addSubview:refreshControl];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[CookieKit shared]addDelegate:self];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationItem setTitle:@"Menu"];
    
    [self reloadMenu];
    
    if(!CGRectEqualToRect(self.view.bounds, frame)){
        [self resizeViews];
    }
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
 
    [currentPopup hide];
    
    [refreshControl endRefreshing];
    [[CookieKit shared]removeDelegate:self];
}

- (void)resizeViews {
    frame = self.view.bounds;
    [menuTableView setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
}

#pragma mark - CookieKit Methods

- (void)cookieKit_syncedMenu {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)reloadMenu {
    pageContent = @[[[CookieKit shared]menu]];
    [menuTableView reloadData];
}

#pragma mark - Menu Popup Delegates

- (void)menuPopup_updateItem:(CKMenuItem *)menuItem withQuantity:(int)quantity {
#warning INCOMPLETE IMPLEMENTATION
}

#pragma mark - Table View Delegates

#warning IMPLEMENT TABLE VIEW DELEGATES

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MenuDetailPopup*popup = [[MenuDetailPopup alloc]initWithMenuItem:pageContent[indexPath.section][indexPath.row] parentViewController:self delegate:self];
    currentPopup = popup;
    [popup show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

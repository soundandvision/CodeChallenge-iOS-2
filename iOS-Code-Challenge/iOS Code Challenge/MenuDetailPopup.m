//
//  MenuDetailPopup.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/16/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "MenuDetailPopup.h"
#import "MPClasses.h"
#import "CookieKit.h"

@interface MenuDetailPopup () <CookieKitDelegate>
{
    CKMenuItem*currnetMenuItem;
    UIViewController*parentViewController;
    
    UIView*popupView;
    
    UIButton*closeBtn;
    UIImageView*itemImageView;
    UIView*itemInfoView;
    
    UILabel*titleLbl;
    UITextView*descriptionTextView;
    
    UIView*actionView;
    
    UILabel*quantityLbl;
    
    UIButton*action_close;
    UIButton*action_add,*action_subtract;
    UIButton*action_buy;
    
    int quantity;
}
@end

@implementation MenuDetailPopup

- (id)initWithMenuItem:(CKMenuItem *)menuItem parentViewController:(UIViewController *)parent delegate:(id<MenuDetailPopupDelegate>)delegate {
    if(self = [super init]){
        currnetMenuItem = menuItem;
        parentViewController = parent;
        self.delegate = delegate;
        
        [self setHidden:YES];
        [self setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.65]];
        
        popupView = [UIView new];
        [popupView setBackgroundColor:UIColorFromRGB(0x333333)];
        [popupView.layer setCornerRadius:5.0];
        [popupView setClipsToBounds:YES];
        [self addSubview:popupView];
        
        closeBtn = [UIButton new];
        [closeBtn setBackgroundColor:[UIColor clearColor]];
        [closeBtn setImage:[UIImage imageNamed:@"popup-close-btn"] forState:UIControlStateNormal];
        [closeBtn setImage:[UIImage imageNamed:@"popup-close-btn-a"] forState:UIControlStateHighlighted];
        [closeBtn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [popupView addSubview:closeBtn];
        
        itemImageView = [UIImageView new];
        [itemImageView setBackgroundColor:[UIColor whiteColor]];
        [itemImageView setContentMode:UIViewContentModeScaleAspectFill];
        [popupView addSubview:itemImageView];
        
        itemInfoView = [UIView new];
        [popupView addSubview:itemInfoView];
        
        titleLbl = [UILabel new];
        [titleLbl setFont:[UIFont fontWithName:@"OpenSans-Light" size:20.0]];
        [titleLbl setTextAlignment:NSTextAlignmentCenter];
        [titleLbl setTextColor:[UIColor whiteColor]];
        [itemInfoView addSubview:titleLbl];
        
        descriptionTextView = [UITextView new];
        [descriptionTextView setFont:[UIFont fontWithName:@"OpenSans" size:14.0]];
        [descriptionTextView setTextAlignment:NSTextAlignmentCenter];
        [descriptionTextView setBackgroundColor:[UIColor clearColor]];
        [descriptionTextView setTextColor:[UIColor whiteColor]];
        [descriptionTextView setEditable:NO];
        [itemInfoView addSubview:descriptionTextView];
        
        actionView = [UIView new];
        [actionView setBackgroundColor:UIColorFromRGB(0x333333)];
        [popupView addSubview:actionView];
        
        quantityLbl = [UILabel new];
        [quantityLbl setBackgroundColor:[UIColor clearColor]];
        [quantityLbl setTextColor:[UIColor whiteColor]];
        [quantityLbl setTextAlignment:NSTextAlignmentCenter];
        [actionView addSubview:quantityLbl];
        
        action_close = [UIButton new];
        [action_close setImage:[UIImage imageNamed:@"popup-bottom-close"] forState:UIControlStateNormal];
        [actionView addSubview:action_close];
        
        action_subtract = [UIButton new];
        [actionView addSubview:action_subtract];
        
        action_add = [UIButton new];
        [actionView addSubview:action_add];
        
        action_buy = [UIButton new];
        [action_buy setImage:[UIImage imageNamed:@"popup-cart"] forState:UIControlStateNormal];
        [actionView addSubview:action_buy];
        
        [quantityLbl setFont:[UIFont fontWithName:@"OpenSans" size:20.0]];
        [action_add.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:25.0]];
        [action_subtract.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:25.0]];
        
        [action_add setTitle:@"+" forState:UIControlStateNormal];
        [action_subtract setTitle:@"-" forState:UIControlStateNormal];
        
        [action_close addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [action_add addTarget:self action:@selector(quantity_add) forControlEvents:UIControlEventTouchUpInside];
        [action_subtract addTarget:self action:@selector(quantity_remove) forControlEvents:UIControlEventTouchUpInside];
        [action_buy addTarget:self action:@selector(quantity_update) forControlEvents:UIControlEventTouchUpInside];
        
        [closeBtn.superview bringSubviewToFront:closeBtn];
        
        [parentViewController.view addSubview:self];
        [self drawRect:parentViewController.view.frame];
        
        //LOAD CONTENT//
#warning INCOMPLETE IMPLEMENTATION
        
    } return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self setFrame:CGRectMake(0, 0, parentViewController.view.frame.size.width, parentViewController.view.frame.size.height)];
    [popupView setFrame:CGRectMake(15, 15, self.frame.size.width-30, self.frame.size.height-30)];
    
    [closeBtn setFrame:CGRectMake(popupView.frame.size.width-35, 0, 35, 35)];
    
    [actionView setFrame:CGRectMake(0, popupView.frame.size.height-44, popupView.frame.size.width, 44)];
    [itemInfoView setFrame:CGRectMake(0, popupView.frame.size.height-170-actionView.frame.size.height, popupView.frame.size.width, 170)];
    [itemImageView setFrame:CGRectMake(0, 0, popupView.frame.size.width, itemInfoView.frame.origin.y)];
    
    [action_close setFrame:CGRectMake(0, 0, 60, 44)];
    
    [self quantity_resizeLbls];
    
    [action_buy setFrame:CGRectMake(actionView.frame.size.width-60, 0, 60, 44)];
    
    [titleLbl setFrame:CGRectMake(0, 10, itemInfoView.frame.size.width, 50)];
    float offset = 1.3*titleLbl.frame.origin.y+titleLbl.frame.size.height;
    [descriptionTextView setFrame:CGRectMake(10, offset, itemInfoView.frame.size.width-20, itemInfoView.frame.size.height-offset)];
}

- (void)show {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)hide {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)quantity_update {
#warning INCOMPLETE IMPLEMENTATION
    [self hide];
}

- (void)quantity_add {
    quantity++;
    [self quantity_updateText];
}

- (void)quantity_remove {
    quantity--;
    [self quantity_updateText];
}

- (void)quantity_updateText {
    [quantityLbl setText:[NSString stringWithFormat:@"%i",quantity]];
    [action_subtract setHidden:(quantity<=0)];
    [self quantity_resizeLbls];
}

- (void)quantity_resizeLbls {
    [quantityLbl sizeToFit];
    
    float width = 45*2+quantityLbl.frame.size.width;
    [action_subtract setFrame:CGRectMake(popupView.frame.size.width/2-width/2, 0, 45, 44)];
    [action_add setFrame:CGRectMake(popupView.frame.size.width/2+width/2-45, 0, 45, 44)];
    [quantityLbl setCenter:CGPointMake(quantityLbl.superview.frame.size.width/2, action_subtract.center.y)];
}

@end

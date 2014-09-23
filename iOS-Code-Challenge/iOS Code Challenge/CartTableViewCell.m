//
//  CartTableViewCell.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/16/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CartTableViewCell.h"
#import "CookieKit.h"
#import "MPClasses.h"

@interface CartTableViewCell ()
{
    CKMenuItem*currentItem;
    
    UIView*selectedBG;
    
    UIImageView*itemImageView;
    UILabel*itemTitleLbl;
    UILabel*itemDescriptionLbl;
    UILabel*itemSubtotalLbl;
    
}
@end

@implementation CartTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        selectedBG = [[UIView alloc]initWithFrame:self.bounds];
        [selectedBG setBackgroundColor:UIColorFromRGB(0x131313)];
        [self setSelectedBackgroundView:selectedBG];
        
        [self setBackgroundColor:UIColorFromRGB(0x1c1c1c)];
        
        itemImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14, 50, 50)];
        [itemImageView setBackgroundColor:[UIColor clearColor]];
        [itemImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:itemImageView];
        
        itemTitleLbl = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, self.frame.size.width-80, 20)];
        [itemTitleLbl setFont:[UIFont fontWithName:@"OpenSans" size:16.0]];
        [itemTitleLbl setBackgroundColor:[UIColor clearColor]];
        [itemTitleLbl setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:itemTitleLbl];
        
        itemDescriptionLbl = [[UILabel alloc]initWithFrame:CGRectMake(70, 42, self.frame.size.width-80, 16)];
        [itemDescriptionLbl setFont:[UIFont fontWithName:@"OpenSans-Light" size:14.0]];
        [itemDescriptionLbl setBackgroundColor:[UIColor clearColor]];
        [itemDescriptionLbl setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:itemDescriptionLbl];
        
        itemSubtotalLbl = [[UILabel alloc]initWithFrame:itemDescriptionLbl.frame];
        [itemSubtotalLbl setFont:[UIFont fontWithName:@"OpenSans" size:14.0]];
        [itemSubtotalLbl setBackgroundColor:[UIColor clearColor]];
        [itemSubtotalLbl setTextColor:[UIColor whiteColor]];
        [itemSubtotalLbl setTextAlignment:NSTextAlignmentRight];
        [self.contentView addSubview:itemSubtotalLbl];
        
    }
    return self;
}

- (void)setItem:(CKMenuItem *)item {
    currentItem = item;
#warning INCOMPLETE IMPLEMENTATION
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end

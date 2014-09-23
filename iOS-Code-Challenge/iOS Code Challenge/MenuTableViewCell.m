//
//  MenuTableViewCell.m
//  iOS Code Challenge
//
//  Created by Max Paulson on 9/15/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "MenuTableViewCell.h"
#import "MPClasses.h"

@interface MenuTableViewCell ()
{
    UIView*selectedBG;
    
    UIImageView*menuImageView;
    UILabel*itemNameLbl;
    UILabel*itemPriceLbl;

    UIImageView*disclosure;
}

@end

@implementation MenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    
        selectedBG = [[UIView alloc]initWithFrame:self.bounds];
        [selectedBG setBackgroundColor:UIColorFromRGB(0x131313)];
        [self setSelectedBackgroundView:selectedBG];
        
        [self setBackgroundColor:UIColorFromRGB(0x1c1c1c)];
        
        UIColor *textColor = UIColorFromRGB(0xfefefe);
        
        menuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 60, 60)];
        [menuImageView setContentMode:UIViewContentModeScaleAspectFit];
        [menuImageView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:menuImageView];
        
        itemNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(90, 15, self.bounds.size.width-110, 20)];
        [itemNameLbl setBackgroundColor:[UIColor clearColor]];
        [itemNameLbl setTextColor:textColor];
        [self.contentView addSubview:itemNameLbl];
        
        itemPriceLbl = [[UILabel alloc]initWithFrame:CGRectMake(90, 35, self.bounds.size.width-110, 20)];
        [itemPriceLbl setBackgroundColor:[UIColor clearColor]];
        [itemPriceLbl setTextColor:textColor];
        [self.contentView addSubview:itemPriceLbl];
        
        [itemNameLbl setFont:[UIFont fontWithName:@"OpenSans" size:18.0]];
        [itemPriceLbl setFont:[UIFont fontWithName:@"OpenSans-Light" size:18.0]];
        
        disclosure = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-20, 10, 20, 50)];
        [disclosure setImage:[UIImage imageNamed:@"list-detail-disclosure"]];
        [self.contentView addSubview:disclosure];
        
    }
    return self;
}

- (void)setImageWithURL:(NSURL *)url {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)setTitle:(NSString *)title {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)setPrice:(float)price {
#warning INCOMPLETE IMPLEMENTATION
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

@end

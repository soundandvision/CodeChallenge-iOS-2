//
//
//  M. PAULSON + COMPANY LLC
//
//  Copyright (c) 2014 m. paulson + company llc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic,retain) NSString*placeholder;
@property (nonatomic,retain) UIColor*placeholderColor;
@property (nonatomic,retain) UIFont*placeholderFont;

-(void)textChanged:(NSNotification*)notification;

@end

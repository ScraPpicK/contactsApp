//
//  ContactTableViewCell.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.infoTextField.delegate = self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.acceptsTouches)
        return self;
    
    if ([self.contentView pointInside:point withEvent:event])
        return self.infoTextField;
    
    return nil;
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCellInfoDidChanged:)])
    {
        [self.delegate tableViewCellInfoDidChanged:self];
    }
    
    return YES;
}

@end

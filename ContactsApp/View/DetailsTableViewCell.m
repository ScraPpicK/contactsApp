//
//  DetailsTableViewCell.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 7/3/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "DetailsTableViewCell.h"
#import "StoreManager.h"

NSString* const detailsTableViewCellIdentifier = @"detailsTableViewCellIdentifier";

@interface DetailsTableViewCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet    UITextField *textField;

@end

@implementation DetailsTableViewCell

+ (NSString *)textTableViewCellIdentifier {
    return detailsTableViewCellIdentifier;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField.delegate = self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self.contentView pointInside:point withEvent:event])
        return self.textField;
    
    return nil;
}

- (void)setText:(NSString *)text
{
    self.textField.text = text;
}

#pragma mark - Text field delegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(tableViewCell:didChangeText:)])
    {
        [self.delegate tableViewCell:self didChangeText:textField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

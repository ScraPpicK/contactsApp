//
//  ContactTableViewCell.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "ContactTableViewCell.h"

NSString* const contactTableViewCellIdentifier = @"contactTableViewCellIdentifier";

@interface ContactTableViewCell () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *infoTextField;

@end

@implementation ContactTableViewCell

+ (NSString *)textTableViewCellIdentifier {
    return contactTableViewCellIdentifier;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.infoTextField.delegate = self;
}

- (void)setText:(NSString *)text
{
    self.infoTextField.text = text;
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

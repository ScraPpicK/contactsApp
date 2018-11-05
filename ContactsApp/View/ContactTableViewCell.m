//
//  ContactTableViewCell.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "ContactTableViewCell.h"

static NSString* const contactTableViewCellIdentifier = @"contactTableViewCellIdentifier";

@implementation ContactTableViewCell

+ (NSString *)textTableViewCellIdentifier {
    return contactTableViewCellIdentifier;
}

- (void)setText:(NSString *)text {
    self.textLabel.text = text;
}

#pragma mark - Text field delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end

//
//  ContactTableViewCell.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "UIKit/UIKit.h"

extern NSString* const contactTableViewCellIdentifier;

@interface ContactTableViewCell : UITableViewCell <UITextFieldDelegate>

- (void)setText:(NSString *)text;

@end

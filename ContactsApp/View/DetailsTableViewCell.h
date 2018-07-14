//
//  DetailsTableViewCell.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 7/3/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString* const detailsTableViewCellIdentifier;

enum DetailsFieldNames {
    firstName = 0,
    lastName,
    phoneNumber,
    streetAddress1,
    streetAddress2,
    city,
    state,
    zipCode
};

@protocol DetailsTableViewCellDelegate

- (void)tableViewCellTextDidChange:(NSString *)text forFieldName:(enum DetailsFieldNames)fieldName;

@end

@interface DetailsTableViewCell : UITableViewCell

@property (nonatomic, weak)     NSObject<DetailsTableViewCellDelegate>  *delegate;

- (void)setText:(NSString *)text withFieldName:(enum DetailsFieldNames)fieldName;

@end

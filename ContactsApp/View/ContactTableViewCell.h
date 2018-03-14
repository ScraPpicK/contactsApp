//
//  ContactTableViewCell.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@class ContactTableViewCell;
@protocol ContactTableViewCellDelegate

- (void)tableViewCellInfoDidChanged:(ContactTableViewCell *)cell;

@end

@interface ContactTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *infoTextField;

@property (nonatomic, weak)     NSObject<ContactTableViewCellDelegate>  *delegate;
@property (nonatomic, assign)   BOOL                                    acceptsTouches;

@end

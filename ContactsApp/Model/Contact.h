//
//  Contact.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"

@interface Contact : NSManagedObject

@property (nonatomic, readonly, copy)   NSString        *contactID;
@property (nonatomic, copy)             NSString        *firstName;
@property (nonatomic, copy)             NSString        *lastName;
@property (nonatomic, copy)             NSString        *phoneNumber;
@property (nonatomic, copy)             NSString        *streetAddress1;
@property (nonatomic, copy)             NSString        *streetAddress2;
@property (nonatomic, copy)             NSString        *city;
@property (nonatomic, copy)             NSString        *state;
@property (nonatomic, copy)             NSString        *zipCode;

@end

//
//  Contact.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "Contact.h"

@interface Contact ()

@property (nonatomic, readwrite, copy)      NSString    *contactID;

@end

@implementation Contact

@dynamic contactID;
@dynamic firstName;
@dynamic lastName;
@dynamic phoneNumber;
@dynamic streetAddress1;
@dynamic streetAddress2;
@dynamic city;
@dynamic state;
@dynamic zipCode;

@end

//
//  Contact.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "Contact.h"

@interface Contact ()

@property (readwrite)      NSString    *contactID;

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

- (void)fillWithDictionary:(NSDictionary<NSString *, NSString *> *)dictionary {
    NSString *firstNameKey = NSStringFromSelector(@selector(firstName));
    self.firstName = dictionary[firstNameKey];
    
    NSString *lastNameKey = NSStringFromSelector(@selector(lastName));
    self.lastName = dictionary[lastNameKey];
    
    NSString *phoneNumberKey = NSStringFromSelector(@selector(phoneNumber));
    self.phoneNumber = dictionary[phoneNumberKey];
    
    NSString *streetAddress1Key = NSStringFromSelector(@selector(streetAddress1));
    self.streetAddress1 = dictionary[streetAddress1Key];
    
    NSString *streetAddress2Key = NSStringFromSelector(@selector(streetAddress2));
    self.streetAddress2 = dictionary[streetAddress2Key];
    
    NSString *stateKey = NSStringFromSelector(@selector(state));
    self.state = dictionary[stateKey];
    
    NSString *cityKey = NSStringFromSelector(@selector(city));
    self.city = dictionary[cityKey];
    
    NSString *zipCodeKey = NSStringFromSelector(@selector(zipCode));
    self.zipCode = dictionary[zipCodeKey];
}

@end

//
//  Contact.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "Contact.h"

#define kFirstNameKey @"First name"
#define kLastNameKey @"Last name"
#define kPhoneNumberKey @"Phone number"
#define kStreetAddress1Key @"Street address 1"
#define kStreetAddress2Key @"Street address 2"
#define kCityKey @"City"
#define kStateKey @"State"
#define kZipCodeKey @"Zip"

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
    self.firstName = dictionary[kFirstNameKey];
    self.lastName = dictionary[kLastNameKey];
    self.phoneNumber = dictionary[kPhoneNumberKey];
    self.streetAddress1 = dictionary[kStreetAddress1Key];
    self.streetAddress2 = dictionary[kStreetAddress2Key];
    self.state = dictionary[kStateKey];
    self.city = dictionary[kCityKey];
    self.zipCode = dictionary[kZipCodeKey];
}

@end

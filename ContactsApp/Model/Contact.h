//
//  Contact.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "CoreData/CoreData.h"

@interface Contact : NSManagedObject

@property (nonatomic, readonly, copy, nonnull)  NSString        *contactID;
@property (nonatomic, copy)                     NSString        *firstName;
@property (nonatomic, copy)                     NSString        *lastName;
@property (nonatomic, copy, nonnull)            NSString        *phoneNumber;
@property (nonatomic, copy, nullable)           NSString        *streetAddress1;
@property (nonatomic, copy, nullable)           NSString        *streetAddress2;
@property (nonatomic, copy, nullable)           NSString        *city;
@property (nonatomic, copy, nullable)           NSString        *state;
@property (nonatomic, copy, nullable)           NSString        *zipCode;

- (void)fillWithDictionary:(NSDictionary<NSString *, NSString *> *)dictionary;

@end

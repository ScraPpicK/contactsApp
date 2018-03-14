//
//  StoreManager.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/14/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@interface StoreManager : NSObject

+ (StoreManager *)sharedManager;

- (NSManagedObjectContext *)defaultContext;
- (void)saveChanges;

- (NSManagedObject *)createNewObjectForEntityName:(NSString *)entityName;
- (NSArray *)getObjectsForEntityName:(NSString *)entityName;
- (void)removeObject:(NSManagedObject *)object;

@end

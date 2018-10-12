//
//  StoreManager.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/14/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "StoreManager.h"
#import "Contact.h"

static StoreManager *sharedManager;

@interface StoreManager ()

@property (nonatomic, strong)   NSManagedObjectContext          *context;
@property (nonatomic, strong)   NSPersistentStoreCoordinator    *storeCoordinator;

@end

@implementation StoreManager

+ (StoreManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [StoreManager new];
    });
    
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        NSString *localStoreFileName = @"ContactsApp.sqlite";
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        if(basePath.length > 0)
        {
            NSURL *storeFileURL = [NSURL fileURLWithPath:[basePath stringByAppendingPathComponent:localStoreFileName]];
            
            NSError *error = nil;
            NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
            self.storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
            
            [self.storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeFileURL options:nil error:&error];
            
            self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            NSAssert(self.context, @"Failed to initialize primary main queue context");
            self.context.persistentStoreCoordinator = self.storeCoordinator;
        }
    }
    
    return self;
}

- (NSManagedObject *)createNewObjectForEntityName:(NSString *)entityName
{
    NSManagedObject *entity = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self.context];
    
    return entity;
}

- (NSArray *)getObjectsForEntityName:(NSString *)entityName
{
    NSArray *array = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    request.returnsObjectsAsFaults = NO;
    
    if (!request)
        return nil;
    
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:NSStringFromSelector(@selector(firstName)) ascending:YES];
    request.sortDescriptors = @[sortDescriptor];
    
    NSError* error = nil;
    array = [self.context executeFetchRequest:request error:&error];
    if (error)
    {
        return nil;
    }
    
    return array;
}

- (void)removeObject:(NSManagedObject *)object
{
     [self.context deleteObject:object];
}

- (NSManagedObjectContext *)defaultContext
{
    return self.context;
}

- (void)saveChanges
{
    if (![self.context hasChanges])
    {
        return;
    }
    
    NSError *error = nil;
    if ([self.context save:&error] == NO)
    {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
}

@end

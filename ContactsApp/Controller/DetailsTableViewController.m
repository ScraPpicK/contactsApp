//
//  DetailsTableViewController.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/14/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "DetailsTableViewCell.h"
#import "StoreManager.h"

static NSString *const firstNameSectionName = @"First name";
static NSString *const lastNameSectionName = @"Last name";
static NSString *const phoneNumberSectionName = @"Phone number";
static NSString *const streetAddressSectionName = @"Street address";
static NSString *const additionalStreetAddressSectionName = @"";
static NSString *const citySectionName = @"City";
static NSString *const stateSectionName = @"State";
static NSString *const zipSectionName = @"Zip code";

enum DetailsFieldNames {
    DetailsFieldFirstName = 0,
    DetailsFieldLastName,
    DetailsFieldPhoneNumber,
    DetailsFieldStreetAddress1,
    DetailsFieldStreetAddress2,
    DetailsFieldCity,
    DetailsFieldState,
    DetailsFieldZipCode
};

@interface DetailsTableViewController () <DetailsTableViewCellDelegate>

@property (nonatomic, strong)   Contact             *contact;
@property (nonatomic, strong)   NSArray<NSString*>  *sectionNames;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *cellNib = [UINib nibWithNibName:@"DetailsTableViewCell" bundle:nil];
    NSString *tableViewCellIdentifier = [DetailsTableViewCell textTableViewCellIdentifier];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:tableViewCellIdentifier];
    
    self.sectionNames = @[firstNameSectionName, lastNameSectionName, phoneNumberSectionName, streetAddressSectionName, additionalStreetAddressSectionName, citySectionName, stateSectionName, zipSectionName];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

- (void)setContact:(Contact *)contact {
    _contact = contact;
}

- (IBAction)deleteContactButtonTap:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Do you really want to delete this contact?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
    }];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[StoreManager sharedManager] removeObject:self.contact];
        [[StoreManager sharedManager] saveChanges];
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:deleteAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionNames.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionNames[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tableViewCellIdentifier = [DetailsTableViewCell textTableViewCellIdentifier];
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    NSUInteger fieldNameIdentifier = indexPath.section;
    cell.tag = fieldNameIdentifier;
    
    switch (fieldNameIdentifier) {
        case DetailsFieldFirstName:
            [cell setText:self.contact.firstName];
            break;
            
        case DetailsFieldLastName:
            [cell setText:self.contact.lastName];
            break;
            
        case DetailsFieldPhoneNumber:
            [cell setText:self.contact.phoneNumber];
            break;
            
        case DetailsFieldStreetAddress1:
            [cell setText:self.contact.streetAddress1];
            break;
            
        case DetailsFieldStreetAddress2:
            [cell setText:self.contact.streetAddress2];
            break;
            
        case DetailsFieldCity:
            [cell setText:self.contact.city];
            break;
            
        case DetailsFieldState:
            [cell setText:self.contact.state];
            break;
            
        case DetailsFieldZipCode:
            [cell setText:self.contact.zipCode];
            break;
    }
    
    return cell;
}

#pragma mark - Contact table view cell delegate

- (void)tableViewCell:(DetailsTableViewCell *)cell didChangeText:(NSString *)text {
    NSUInteger fieldNameIdentifier = cell.tag;
    switch (fieldNameIdentifier)
    {
        case DetailsFieldFirstName:
            self.contact.firstName = text;
            break;

        case DetailsFieldLastName:
            self.contact.lastName = text;
            break;

        case DetailsFieldPhoneNumber:
            self.contact.phoneNumber = text;
            break;

        case DetailsFieldStreetAddress1:
            self.contact.streetAddress1 = text;
            break;

        case DetailsFieldStreetAddress2:
            self.contact.streetAddress2 = text;
            break;

        case DetailsFieldCity:
            self.contact.city = text;
            break;

        case DetailsFieldState:
            self.contact.state = text;
            break;

        case DetailsFieldZipCode:
            self.contact.zipCode = text;
            break;
    }

    [[StoreManager sharedManager] saveChanges];
}

@end

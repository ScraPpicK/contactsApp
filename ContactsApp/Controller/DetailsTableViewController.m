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

@interface DetailsTableViewController () <DetailsTableViewCellDelegate>

@property (nonatomic, strong)   Contact             *contact;
@property (nonatomic, strong)   NSArray<NSString*>  *sectionNames;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *cellNib = [UINib nibWithNibName:@"DetailsTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:detailsTableViewCellIdentifier];
    
    self.sectionNames = @[firstNameSectionName, lastNameSectionName, phoneNumberSectionName, streetAddressSectionName, additionalStreetAddressSectionName, citySectionName, stateSectionName, zipSectionName];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)setContact:(Contact *)contact {
    if (_contact == nil) {
        _contact = contact;
    }
}

- (IBAction)deleteContactButtonTap:(id)sender
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Do you really want to delete this contact?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
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
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailsTableViewCellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    switch (indexPath.section) {
        case firstName:
            [cell setText:self.contact.firstName withFieldName:firstName];
            break;
            
        case lastName:
            [cell setText:self.contact.lastName withFieldName:lastName];
            break;
            
        case phoneNumber:
            [cell setText:self.contact.phoneNumber withFieldName:phoneNumber];
            break;
            
        case streetAddress1:
            [cell setText:self.contact.streetAddress1 withFieldName:streetAddress1];
            break;
            
        case streetAddress2:
            [cell setText:self.contact.streetAddress2 withFieldName:streetAddress2];
            break;
            
        case city:
            [cell setText:self.contact.city withFieldName:city];
            break;
            
        case state:
            [cell setText:self.contact.state withFieldName:state];
            break;
            
        case zipCode:
            [cell setText:self.contact.zipCode withFieldName:zipCode];
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Contact table view cell delegate

- (void)tableViewCellTextDidChange:(NSString *)text forFieldName:(enum DetailsFieldNames)fieldName
{
    switch (fieldName)
    {
        case firstName:
            self.contact.firstName = text;
            break;
            
        case lastName:
            self.contact.lastName = text;
            break;
            
        case phoneNumber:
            self.contact.phoneNumber = text;
            break;
            
        case streetAddress1:
            self.contact.streetAddress1 = text;
            break;
            
        case streetAddress2:
            self.contact.streetAddress2 = text;
            break;
            
        case city:
            self.contact.city = text;
            break;
            
        case state:
            self.contact.state = text;
            break;
            
        case zipCode:
            self.contact.zipCode = text;
            break;
            
        default:
            [[StoreManager sharedManager] saveChanges];
            break;
    }
}

@end

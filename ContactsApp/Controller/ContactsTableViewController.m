//
//  ContactsTableViewController.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "ContactTableViewCell.h"
#import "Contact.h"
#import "StoreManager.h"
#import "DetailsTableViewController.h"

static NSString * const contactDetailsSegueIdentifier = @"Show contact detail segue";

@interface ContactsTableViewController ()

@property (nonatomic, strong)           NSArray<Contact *>      *contacts;

@end

@implementation ContactsTableViewController

@dynamic tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"ContactTableViewCell" bundle:nil];
    NSString *tableViewCellIdentifier = [ContactTableViewCell textTableViewCellIdentifier];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:tableViewCellIdentifier];
    
    self.tableView.tableFooterView = [UIView new];
    
    self.contacts = [[StoreManager sharedManager] getObjectsForEntityName:[Contact description]];
    
    if (!self.contacts.count) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Contacts" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:path];
        NSError *error;
        NSDictionary * defaultContacts = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        NSArray<NSDictionary *> * contactsArray = defaultContacts[@"contacts"];
        [contactsArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull contactDictionary, NSUInteger idx, BOOL * _Nonnull stop) {
            Contact * contact = (Contact *)[[StoreManager sharedManager] createNewObjectForEntityName:@"Contact"];
            [contact fillWithDictionary:contactDictionary];
            
            [[StoreManager sharedManager] saveChanges];
        }];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.contacts = [[StoreManager sharedManager] getObjectsForEntityName:@"Contact"];;
    [self.tableView reloadData];
}

- (IBAction)addNewContactButtonTap:(id)sender {
    [self performSegueWithIdentifier:contactDetailsSegueIdentifier sender:nil];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tableViewCellIdentifier = [ContactTableViewCell textTableViewCellIdentifier];
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifier forIndexPath:indexPath];
    
    Contact *contact = self.contacts[indexPath.row];
    NSString *firstName = contact.firstName ? contact.firstName : @"";
    NSString *lastName = contact.lastName ? contact.lastName : @"";
    
    [cell setText:[NSString stringWithFormat:@"%@ %@", firstName, lastName]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *contact = [self.contacts objectAtIndex:indexPath.row];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:contactDetailsSegueIdentifier sender:contact];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:contactDetailsSegueIdentifier]) {
        DetailsTableViewController *detailsController = (DetailsTableViewController *)segue.destinationViewController;
        [detailsController setContact:sender];
    }
}

@end

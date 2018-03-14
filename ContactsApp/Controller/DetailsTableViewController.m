//
//  DetailsTableViewController.m
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/14/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import "DetailsTableViewController.h"
#import "ContactTableViewCell.h"
#import "StoreManager.h"

@interface DetailsTableViewController () <UITableViewDelegate, UITableViewDataSource, ContactTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINib *cellNib = [UINib nibWithNibName:@"ContactTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"ContactTableViewCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3)
        return 2;
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *string = nil;
    
    switch (section) {
        case 0:
            string = @"First name";
            break;
            
        case 1:
            string = @"Last name";
            break;
            
        case 2:
            string = @"Phone number";
            break;
            
        case 3:
            string = @"Street Address";
            break;
            
        case 4:
            string = @"City";
            break;
            
        case 5:
            string = @"State";
            break;
            
        case 6:
            string = @"Zip code";
            break;
            
        default:
            break;
    }
    
    return string;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactTableViewCell" forIndexPath:indexPath];
    
    NSString *string = nil;
    
    switch (indexPath.section) {
        case 0:
            string = self.contact.firstName;
            break;
            
        case 1:
            string = self.contact.lastName;
            break;
            
        case 2:
            string = self.contact.phoneNumber;
            break;
            
        case 3:
            switch (indexPath.row) {
                case 0:
                    string = self.contact.streetAddress1;
                    break;
                    
                case 1:
                    string = self.contact.streetAddress2;
                    break;
                    
                default:
                    break;
            }
            break;
            
        case 4:
            string = self.contact.city;
            break;
            
        case 5:
            string = self.contact.state;
            break;
            
        case 6:
            string = self.contact.zipCode;
            break;
            
        default:
            break;
    }
    
    cell.acceptsTouches = NO;
    cell.delegate = self;
    cell.infoTextField.text = string;
    
    return cell;
}

#pragma mark - Contact table view cell delegate

- (void)tableViewCellInfoDidChanged:(ContactTableViewCell *)cell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    switch (indexPath.section)
    {
        case 0:
            self.contact.firstName = cell.infoTextField.text;
            break;
            
        case 1:
            self.contact.lastName = cell.infoTextField.text;
            break;
            
        case 2:
            self.contact.phoneNumber = cell.infoTextField.text;
            break;
            
        case 3:
            switch (indexPath.row) {
                case 0:
                    self.contact.streetAddress1 = cell.infoTextField.text;
                    break;
                    
                case 1:
                    self.contact.streetAddress2 = cell.infoTextField.text;
                    
                default:
                    break;
            }
            break;
            
        case 4:
            self.contact.city = cell.infoTextField.text;
            break;
            
        case 5:
            self.contact.state = cell.infoTextField.text;
            break;
            
        case 6:
            self.contact.zipCode = cell.infoTextField.text;
            break;
            
        default:
            break;
    }
    
    [[StoreManager sharedManager] saveChanges];
}

@end

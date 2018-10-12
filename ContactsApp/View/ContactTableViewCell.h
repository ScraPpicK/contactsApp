//
//  ContactTableViewCell.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 3/13/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellProtocol.h"
#import "TextTableViewCellProtocol.h"

@interface ContactTableViewCell : UITableViewCell <TableViewCellProtocol, TextTableViewCellProtocol>

@end

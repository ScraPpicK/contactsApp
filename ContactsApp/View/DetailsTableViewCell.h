//
//  DetailsTableViewCell.h
//  ContactsApp
//
//  Created by Patalakh Vadim on 7/3/18.
//  Copyright © 2018 Patalakh Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellProtocol.h"
#import "TextTableViewCellProtocol.h"

@class DetailsTableViewCell;
@protocol DetailsTableViewCellDelegate

- (void)tableViewCell:(DetailsTableViewCell *)cell didChangeText:(NSString *)text;

@end

@interface DetailsTableViewCell : UITableViewCell <TableViewCellProtocol, TextTableViewCellProtocol>

@property (nonatomic, weak)     NSObject<DetailsTableViewCellDelegate>  *delegate;

@end

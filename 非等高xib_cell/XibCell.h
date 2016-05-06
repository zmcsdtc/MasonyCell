//
//  XibCell.h
//  非等高xib_cell
//
//  Created by ZMC on 16/3/6.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Status;
@interface XibCell : UITableViewCell
+(instancetype)cellWithTablebview:(UITableView*)tableView;
@property(strong,nonatomic)Status*status;

@end

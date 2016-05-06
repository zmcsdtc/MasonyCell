//
//  MeCell.h
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChatModel;
@interface MeCell : UITableViewCell

+(MeCell*)initWithTableView:(UITableView*)tableView;

@property(strong,nonatomic)ChatModel*model;


@end

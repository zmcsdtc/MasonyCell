//
//  XibCell.m
//  非等高xib_cell
//
//  Created by ZMC on 16/3/6.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "XibCell.h"
#import "Status.h"
@interface XibCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipIcon;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end;

@implementation XibCell



+(instancetype)cellWithTablebview:(UITableView *)tableView{
    static NSString*cellID=@"CELLID";
    XibCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
    // 设置label每一行文字的最大宽度
    // 为了保证计算出来的数值 跟 真正显示出来的效果 一致
    self.contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}
- (void) setStatus:(Status *)status{
    _status=status;
    if (status.isVip) {
        self.vipIcon.hidden=NO;
        self.nameLabel.textColor=[UIColor orangeColor];
    }
    else{
        self.vipIcon.hidden=YES;
        self.nameLabel.textColor=[UIColor lightGrayColor];
    }
    self.nameLabel.text=status.name;
    self.contentLabel.text=status.text;
    self.iconView.image=[UIImage imageNamed:status.icon];
    if (status.picture) {
        self.imgView.image=[UIImage imageNamed:status.picture];
        self.imgView.hidden=NO;
    }
    else{
        self.imgView.hidden=YES;
    }
    
        [self layoutIfNeeded];
    if (self.imgView.hidden) { // 没有配图
        status.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10;
    } else { // 有配图
        status.cellHeight = CGRectGetMaxY(self.imgView.frame) + 10;
    }
}
@end

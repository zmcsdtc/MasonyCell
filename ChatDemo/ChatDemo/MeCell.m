//
//  MeCell.m
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "MeCell.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "ChatModel.h"
@interface MeCell()
@property(strong,nonatomic)UIImageView*iconView;
@property(strong,nonatomic)UILabel*nameLabel;
@property(strong,nonatomic)UILabel*contentLable;

@end

@implementation MeCell

+(MeCell*)initWithTableView:(UITableView *)tableView{
    static NSString*cellId=@"CELLID";
    MeCell*cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[MeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconView=[[UIImageView alloc]init];
        self.nameLabel=[[UILabel alloc]init];
        self.contentLable=[[UILabel alloc]init];
        [self.contentView addSubview:_iconView];
        [self.contentView addSubview:_contentLable];
        [self.contentView addSubview:_nameLabel];
        [self setUpMasonry];
        _contentLable.numberOfLines=0;
        _nameLabel.numberOfLines=0;
    }
    return  self;
}
- (void) setUpMasonry{
    CGFloat margin=10;
    [_iconView makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(40);
        make.top.offset(margin);
        make.left.offset(margin);
    }];
    
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.right).offset(margin);
        make.top.offset(margin);
        make.right.offset(-margin);
    }];
    
    [_contentLable makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.right).offset(margin);
        make.top.equalTo(_nameLabel.bottom).offset(margin);
        make.right.offset(-margin);
    }];
}

- (void) setModel:(ChatModel *)model{
    self.nameLabel.text = model.name;
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.contentLable.text = model.text;
    [self layoutIfNeeded];
    if (CGRectGetMaxY(_iconView.frame)>CGRectGetMaxY(_contentLable.frame)) {
        model.cellHeight=CGRectGetMaxY(_iconView.frame)+10;
    }
    else{
        model.cellHeight=CGRectGetMaxY(_contentLable.frame)+10;
    }
}

@end

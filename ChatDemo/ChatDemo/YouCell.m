//
//  YouCell.m
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "YouCell.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "ChatModel.h"
@interface YouCell()
@property(strong,nonatomic)UIImageView*iconView;
@property(strong,nonatomic)UILabel*nameLabel;
@property(strong,nonatomic)UILabel*contentLable;
@property(strong,nonatomic)UIImageView*bgImageview;
@end
@implementation YouCell


+(YouCell*)initWithTableView:(UITableView *)tableView{
    static NSString*cellId=@"YouCellId";
    YouCell*cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[YouCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconView=[[UIImageView alloc]init];
        self.nameLabel=[[UILabel alloc]init];
        self.contentLable=[[UILabel alloc]init];
        self.bgImageview=[[UIImageView alloc]init];
        [self.contentView addSubview:_bgImageview];
        [self.contentView addSubview:_iconView];
        [self.contentView addSubview:_contentLable];
        [self.contentView addSubview:_nameLabel];
        [self setUpMasonry];
        _contentLable.numberOfLines=0;
        _nameLabel.numberOfLines=0;
        _contentLable.textAlignment=NSTextAlignmentRight;
        //设置最大宽度-必须要,不然无法换行
        _contentLable.preferredMaxLayoutWidth=
        [UIScreen mainScreen].bounds.size.width-90;
        
        //图片拉伸
        UIImage *image = [UIImage imageNamed:@"chat_sender_bg"];
        CGFloat top = image.size.height * 0.8;
        CGFloat left = image.size.width * 0.5;
        CGFloat bottom = image.size.height * 0.5;
        CGFloat right = image.size.width * 0.5;
        UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
        /*UIImageResizingModeStretch：拉伸模式，通过拉伸UIEdgeInsets指定的矩形区域来填充图片
        UIImageResizingModeTile：平铺模式，通过重复显示UIEdgeInsets指定的矩形区域来填充图片*/
        UIImageResizingMode mode = UIImageResizingModeStretch;
        UIImage *newImage = [image resizableImageWithCapInsets:edgeInsets resizingMode:mode];
        _bgImageview.image=newImage;
    }
    return  self;
}
- (void) setUpMasonry{
    CGFloat margin=10;
    [_iconView makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(40);
        make.top.offset(margin);
        make.right.offset(-margin);
    }];
    
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(margin);
        make.right.equalTo(_iconView.mas_left).offset(-margin);
    }];
    
    [_contentLable makeConstraints:^(MASConstraintMaker *make) {
         make.right.equalTo(_iconView.mas_left).offset(-2*margin);
        make.top.equalTo(_nameLabel.bottom).offset(2*margin);
    }];
    [_bgImageview makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_contentLable.right).offset(margin);
        make.top.equalTo(_contentLable.top).offset(-margin);
        make.left.equalTo(_contentLable.left).offset(-margin);
        make.bottom.equalTo(_contentLable.bottom).offset(margin);
        
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
        model.cellHeight=CGRectGetMaxY(_bgImageview.frame)+10;
    }
}

@end

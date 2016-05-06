//
//  ChatModel.m
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "ChatModel.h"

@implementation ChatModel
+(instancetype)MessageWithDict:(NSDictionary *)dict{
    ChatModel*chat=[[ChatModel alloc]init];
    [chat setValuesForKeysWithDictionary:dict];
    return chat;
}
@end

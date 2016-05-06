//
//  ChatModel.h
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ChatModel : NSObject
@property(copy,nonatomic)NSString*text;
@property(copy,nonatomic)NSString*icon;
@property(copy,nonatomic)NSString*name;
@property(strong,nonatomic)NSString*user;
+ (instancetype)MessageWithDict:(NSDictionary *)dict;
/** cell的高度 */
@property (assign, nonatomic) CGFloat cellHeight;
@end

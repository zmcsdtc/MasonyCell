//
//  Status.h
//  非等高xib_cell
//
//  Created by ZMC on 16/3/6.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Status : NSObject
@property(copy,nonatomic)NSString*text;
@property(copy,nonatomic)NSString*icon;
@property(copy,nonatomic)NSString*name;
@property(copy,nonatomic)NSString*picture;
@property(assign,nonatomic,getter=isVip)BOOL vip;
+ (instancetype)statusWithDict:(NSDictionary *)dict;
/** cell的高度 */
@property (assign, nonatomic) CGFloat cellHeight;
@end

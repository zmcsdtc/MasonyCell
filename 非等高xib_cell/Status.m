//
//  Status.m
//  非等高xib_cell
//
//  Created by ZMC on 16/3/6.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "Status.h"

@implementation Status
+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    Status *status = [[self alloc] init];
    [status setValuesForKeysWithDictionary:dict];
    return status;
}
@end

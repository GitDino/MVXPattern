//
//  DOCommodity.m
//  MVCDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCommodity.h"

@implementation DOCommodity

#pragma mark - Public Cycle

+ (instancetype)commedityWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img
{
    DOCommodity *commodity = [[DOCommodity alloc] init];
    commodity.name = name;
    commodity.price = price;
    commodity.img = img;
    return commodity;
}

@end

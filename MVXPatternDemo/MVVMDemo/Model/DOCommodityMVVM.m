//
//  DOCommodityMVVM.m
//  MVVMDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCommodityMVVM.h"

@implementation DOCommodityMVVM

#pragma mark - Public Cycle

+ (instancetype)commedityMVVMWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img
{
    DOCommodityMVVM *commodity = [[DOCommodityMVVM alloc] init];
    commodity.name = name;
    commodity.price = price;
    commodity.img = img;
    return commodity;
}

@end

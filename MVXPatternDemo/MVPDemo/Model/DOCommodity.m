//
//  DOCommodity.m
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCommodity.h"

@implementation DOCommodity

#pragma mark - Public Cycle

+ (instancetype)commedityWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img
{
    DOCommodity *commdity = [[DOCommodity alloc] init];
    commdity.name = name;
    commdity.price = price;
    commdity.img = img;
    return commdity;
}

@end

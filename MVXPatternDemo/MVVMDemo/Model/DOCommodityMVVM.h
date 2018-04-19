//
//  DOCommodityMVVM.h
//  MVVMDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOCommodityMVVM : NSObject

/**
 商品名
 */
@property (nonatomic, copy) NSString *name;

/**
 商品价格
 */
@property (nonatomic, copy) NSString *price;

/**
 商品图片
 */
@property (nonatomic, strong) UIImage *img;

/**
 创建商品
 
 @param name 名字
 @param price 价格
 @param img 图片
 */
+ (instancetype)commedityMVVMWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img;

@end

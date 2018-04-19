//
//  DOCommodityPresenter.h
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOUICommodity : NSObject

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
 创建UI数据模型

 @param name 名字
 @param price 价格
 @param img 图片
 */
+ (instancetype)uiCommodityWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img;

@end

@protocol DOCommodityPresenterDelegate <NSObject>

/**
 请求成功

 @param data_array 模型数组
 */
- (void)successWithCommodityData:(NSArray *) data_array;

/**
 请求失败

 @param error_str 错误信息
 */
- (void)failWithError:(NSString *) error_str;

@end

@interface DOCommodityPresenter : NSObject

@property (nonatomic, weak) id<DOCommodityPresenterDelegate> delegate;

/**
 模拟网络请求
 */
- (void)postData;

@end

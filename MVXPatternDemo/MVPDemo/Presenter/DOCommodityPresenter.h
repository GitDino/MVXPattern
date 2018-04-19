//
//  DOCommodityPresenter.h
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

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

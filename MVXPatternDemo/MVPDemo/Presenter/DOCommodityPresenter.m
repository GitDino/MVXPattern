//
//  DOCommodityPresenter.m
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCommodityPresenter.h"
#import "DOCommodity.h"

@implementation DOUICommodity

+ (instancetype)uiCommodityWithName:(NSString *) name price:(NSString *) price img:(UIImage *) img
{
    DOUICommodity *ui_commodity = [[DOUICommodity alloc] init];
    ui_commodity.name = name;
    ui_commodity.price = price;
    ui_commodity.img = img;
    return ui_commodity;
}

@end

@implementation DOCommodityPresenter

/**
 模拟网络请求
 */
- (void)postData
{
    NSMutableArray *data_array = [NSMutableArray array];
    for (int i = 0; i < 15; i ++)
    {
        DOCommodity *commodity = [DOCommodity commedityWithName:[NSString stringWithFormat:@"%d", i] price:[NSString stringWithFormat:@"%d", i * 100] img:[UIImage imageNamed:@"icon_commodity"]];
        
        DOUICommodity *ui_commodity = [DOUICommodity uiCommodityWithName:commodity.name price:commodity.price img:commodity.img];
        
        [data_array addObject:ui_commodity];
    }
    
    if (data_array)
    {
        if ([self.delegate respondsToSelector:@selector(successWithCommodityData:)])
        {
            [self.delegate successWithCommodityData:data_array];
        }
    }
    else
    {
        if ([self.delegate respondsToSelector:@selector(failWithError:)])
        {
            [self.delegate failWithError:@"请求出错！"];
        }
    }
}

@end

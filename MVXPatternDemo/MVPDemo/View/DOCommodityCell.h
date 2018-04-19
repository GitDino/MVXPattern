//
//  DOCommodityCell.h
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOCommodity;

@interface DOCommodityCell : UITableViewCell

@property (nonatomic, strong) DOCommodity *commodity;

/**
 创建商品Cell
 
 @param tableView 列表
 */
+ (instancetype)commodityCellWithTableView:(UITableView *) tableView;

@end

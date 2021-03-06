//
//  DOCommodityCellMVP.h
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOUICommodity;

@interface DOCommodityCellMVP : UITableViewCell

@property (nonatomic, strong) DOUICommodity *ui_commodity;

/**
 创建商品Cell
 
 @param tableView 列表
 */
+ (instancetype)commodityCellMVPWithTableView:(UITableView *) tableView;

@end

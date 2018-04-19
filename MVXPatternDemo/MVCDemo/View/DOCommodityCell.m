//
//  DOCommodityCell.m
//  MVCDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOCommodityCell.h"

#import "DOCommodity.h"

@interface DOCommodityCell ()

@property (nonatomic, strong) UIImageView *icon_image;

@property (nonatomic, strong) UILabel *name_label;

@property (nonatomic, strong) UILabel *price_label;

@end

@implementation DOCommodityCell

#pragma mark - Public Cycle

+ (instancetype)commodityCellWithTableView:(UITableView *) tableView
{
    static NSString *ID = @"DOCommodityCell";
    DOCommodityCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[DOCommodityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - Life Cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _icon_image = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 60, 50)];
        [self.contentView addSubview:_icon_image];
        
        _name_label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_icon_image.frame) + 12, 12, 100, 50)];
        [self.contentView addSubview:_name_label];
        
        _price_label = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 12 - 100, 12, 100, 50)];
        [self.contentView addSubview:_price_label];
    }
    return self;
}

#pragma mark - Setter Cycle

- (void)setCommodity:(DOCommodity *)commodity
{
    _commodity = commodity;
    
    _icon_image.image = _commodity.img;
    
    _name_label.text = _commodity.name;
    
    _price_label.text = _commodity.price;
}

@end

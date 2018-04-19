//
//  DORootVC.m
//  MVCDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import <MJRefresh.h>
#import "DORootVC.h"

#import "DOCommodityCell.h"

#import "DOCommodity.h"

@interface DORootVC ()<UITableViewDataSource>

@property (nonatomic, strong) UITableView *list_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@end

@implementation DORootVC

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVC模式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.data_array = [NSMutableArray array];
    
    [self configSubViews];
    
    [self postData];
}

#pragma mark - Custom Cycle

- (void)configSubViews
{
    self.list_tableView.dataSource = self;
    [self.view addSubview:self.list_tableView];
}

#pragma mark - Post Cycle
 /**
  模拟数据网络请求
  */
 - (void)postData
{
    __weak typeof(self) weakSelf = self;
    self.list_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.data_array removeAllObjects];
        
        for (int i = 0; i < 15; i ++)
        {
            DOCommodity *commodity = [DOCommodity commedityWithName:[NSString stringWithFormat:@"%d", i] price:[NSString stringWithFormat:@"%d", i * 100] img:[UIImage imageNamed:@"icon_commodity"]];
            [weakSelf.data_array addObject:commodity];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.list_tableView.mj_header endRefreshing];
            [weakSelf.list_tableView reloadData];
        });
    }];
    [self.list_tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDataSource数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data_array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DOCommodityCell *cell = [DOCommodityCell commodityCellWithTableView:tableView];
    cell.commodity = self.data_array[indexPath.row];
    return cell;
}

#pragma mark - Getter Cycle

- (UITableView *)list_tableView
{
    if (!_list_tableView)
    {
        _list_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _list_tableView.rowHeight = 74.0;
    }
    return _list_tableView;
}

@end

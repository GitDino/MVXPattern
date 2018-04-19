//
//  DORootVC.m
//  MVVMDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import <MJRefresh.h>
#import "DORootVC.h"

#import "DOCommodityViewModel.h"

@interface DORootVC ()

@property (nonatomic, strong) UITableView *list_tableView;

@property (nonatomic, strong) DOCommodityViewModel *commodity_viewModel;

@end

@implementation DORootVC

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM模式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle

- (void)configSubViews
{
//    self.list_tableView.dataSource = self;
    [self.view addSubview:self.list_tableView];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.list_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.list_tableView.mj_header endRefreshing];
        });
    }];
    [self.list_tableView.mj_header beginRefreshing];
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

- (DOCommodityViewModel *)commodity_viewModel
{
    if (!_commodity_viewModel)
    {
        _commodity_viewModel = [[DOCommodityViewModel alloc] init];
    }
    return _commodity_viewModel;
}

@end

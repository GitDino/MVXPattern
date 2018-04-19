//
//  DORootVC.m
//  MVPDemo
//
//  Created by 魏欣宇 on 2018/4/20.
//  Copyright © 2018年 Dino. All rights reserved.
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import <MJRefresh.h>
#import "DORootVC.h"

#import "DOCommodityCell.h"

#import "DOCommodityPresenter.h"

@interface DORootVC ()<UITableViewDataSource, DOCommodityPresenterDelegate>

@property (nonatomic, strong) UITableView *list_tableView;

@property (nonatomic, strong) DOCommodityPresenter *commodity_presenter;

@property (nonatomic, strong) NSArray *data_array;

@end

@implementation DORootVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVP模式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle

- (void)configSubViews
{
    self.commodity_presenter.delegate = self;
    
    self.list_tableView.dataSource = self;
    [self.view addSubview:self.list_tableView];
}

#pragma mark - Post Cycle

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.list_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.commodity_presenter postData];
    }];
    [self.list_tableView.mj_header beginRefreshing];
}

#pragma mark - DOCommodityPresenterDelegate代理方法
- (void)successWithCommodityData:(NSArray *)data_array
{
    [self.list_tableView.mj_header endRefreshing];
    self.data_array = data_array;
    [self.list_tableView reloadData];
}

- (void)failWithError:(NSString *)error_str
{
    [self.list_tableView.mj_header endRefreshing];
    NSLog(@"----%@----", error_str);
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

- (DOCommodityPresenter *)commodity_presenter
{
    if (!_commodity_presenter)
    {
        _commodity_presenter = [[DOCommodityPresenter alloc] init];
    }
    return _commodity_presenter;
}

@end

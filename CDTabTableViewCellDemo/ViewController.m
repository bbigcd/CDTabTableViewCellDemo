//
//  ViewController.m
//  CDTabTableViewCellDemo
//
//  Created by bbigcd on 2016/12/14.
//  Copyright © 2016年 bbigcd. All rights reserved.
//

#import "ViewController.h"

#define  Width  [UIScreen mainScreen].bounds.size.width
#define  Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
}
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

static NSString *const ID = @"Cell";
static CGFloat const rowHeightN = 30.0f;
static CGFloat const rowHeightS = 62.0f;
static NSInteger const numberOfSections = 3;
static NSInteger const numberOfRows = 5;

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}

#pragma mark - -- UITableViewDataSource --

BOOL isClose[2];

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return isClose[section] ? 0 : numberOfRows;//取得对应组的标示
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 2 ? rowHeightS : rowHeightN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat height = (section == 2) ? rowHeightS : rowHeightN;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, height)];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = section;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, Width, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"name";
    [btn addSubview:titleLabel];
    
    // 下面是模拟cell
    if (section == 2) {
        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, Width, 1)];
        line1.backgroundColor = [UIColor darkGrayColor];
        [btn addSubview:line1];
        
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(10, 31, Width, 30)];
        text.backgroundColor = [UIColor clearColor];
        text.text = @"test";
        [btn addSubview:text];
        
        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 61, Width, 1)];
        line2.backgroundColor = [UIColor darkGrayColor];
        [btn addSubview:line2];
    }
    return btn;
}

- (void)buttonAction:(UIButton *)button {
    NSInteger section = button.tag;//取得点击的组
    isClose[section] = !isClose[section];//取得对应组的标示
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = @"cdcdcdcdcdcd";
    
    return cell;
}



@end

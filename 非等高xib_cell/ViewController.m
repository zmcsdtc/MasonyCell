//
//  ViewController.m
//  非等高xib_cell
//
//  Created by ZMC on 16/3/6.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "ViewController.h"
#import "Status.h"
#import "XibCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSMutableArray*statuses;
@property(strong,nonatomic)UITableView*tableView;
@end

@implementation ViewController

//- (NSArray *)statuses
//{
//    if (_statuses == nil) {
//        // 加载plist中的字典数组
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
//        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
//
//        // 字典数组 -> 模型数组
//        NSMutableArray *statusArray = [NSMutableArray array];
//        for (NSDictionary *dict in dictArray) {
//            Status *status = [Status initWithDict:dict];
//            [statusArray addObject:status];
//        }
//
//        _statuses = statusArray;
//    }
//    return _statuses;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载plist中的字典数组
    NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    // 字典数组 -> 模型数组
   self.statuses= [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        Status *status = [Status statusWithDict:dict];
        [self.statuses addObject:status];
    }
    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
    
    
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XibCell *cell = [XibCell cellWithTablebview:tableView];
    cell.status = self.statuses[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Status *staus = self.statuses[indexPath.row];
    return staus.cellHeight;
}

/**
 * 返回每一行的估计高度
 * 只要返回了估计高度，那么就会先调用tableView:cellForRowAtIndexPath:方法创建cell，再调用tableView:heightForRowAtIndexPath:方法获取cell的真实高度
 */
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  ChatDemo
//
//  Created by ZMC on 16/3/16.
//  Copyright © 2016年 Zmc. All rights reserved.
//

#import "ViewController.h"
#import "ChatModel.h"
#import "MeCell.h"
#import "YouCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)NSMutableArray*MessagesArray;
@property(strong,nonatomic)UITableView*tableView;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"titile";
    self.view.backgroundColor=[UIColor greenColor];
    NSString*path=[[NSBundle mainBundle]pathForResource:@"ChatMessage.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    _MessagesArray=[NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        ChatModel*model=[ChatModel MessageWithDict:dict];
        [_MessagesArray addObject:model];
    }
    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.MessagesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell=nil;
    ChatModel* model=self.MessagesArray[indexPath.row];
    if ([model.user isEqualToString:@"me"]) {
        cell=[MeCell initWithTableView:tableView];
        MeCell*meCell=(MeCell*)cell;
        meCell.model=self.MessagesArray[indexPath.row];
    }
    else{
        cell=[YouCell initWithTableView:tableView];
        YouCell*youCell=(YouCell*)cell;
        youCell.model=self.MessagesArray[indexPath.row];
    }
    return cell;
}
//- (MeCell *)creatMeCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MeCell *cell = [MeCell initWithTableView:tableView];
//    cell.model=self.MessagesArray[indexPath.row];
//    return cell;
//}
//- (YouCell *)creatYouCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    YouCell *cell = [YouCell initWithTableView:tableView];
//    cell.model=self.MessagesArray[indexPath.row];
//    return cell;
//}
#pragma mark - 代理方法
/**
 *  返回每一行的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatModel*model=self.MessagesArray[indexPath.row];
    return model.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

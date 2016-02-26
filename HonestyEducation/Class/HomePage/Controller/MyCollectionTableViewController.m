//
//  MyCollectionTableViewController.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/25.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "MyCollectionTableViewController.h"
#import "HomePageTableViewCell.h"
#import "HomePageModel.h"
static NSString *const reusrIdentifier = @"HomePageTableViewCell";
@interface MyCollectionTableViewController ()
@property (nonatomic, strong) NSMutableArray *arrList;
@end

@implementation MyCollectionTableViewController
- (NSMutableArray *)arrList {
    if (!_arrList) {
        self.arrList = [NSMutableArray array];
    }
    return _arrList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    self.tableView.backgroundColor = kGlobalBg;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.rowHeight = 80;
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusrIdentifier forIndexPath:indexPath];
//    HomePageModel *model = self.arrList[indexPath.row];
//    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

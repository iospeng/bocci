//
//  MemberCenterViewController.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/25.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "GlobalTableCell.h"
#import <UIButton+WebCache.h>
#import "MyCertificationViewController.h"
#import "MyCollectionTableViewController.h"
#import "ChangePassWordViewController.h"
@interface MemberCenterViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_imageArray;
    NSArray *_titleArray;
} 
@property (weak, nonatomic) IBOutlet UIButton *avartView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kGlobalBg;
    [self configureData];
    [self setUpSubViews];
}

- (void)setUpSubViews {
    self.contentTableView.backgroundColor = kGlobalBg;
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.rowHeight = 50;
}
- (void)configureData {
    _imageArray = @[@"SafeProtect_email", @"SafeProtect_email", @"SafeProtect_email", @"SafeProtect_email"];
    _titleArray = @[@"我的成绩", @"资讯反馈", @"更改密码", @"我的收藏"];
//    [self.avartView sd_setBackgroundImageWithURL:[NSURL URLWithString:@""] forState:UIControlStateNormal];
//    self.nameLabel.text = @"66666";
//    self.companyLabel.text = @"33333";
}
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GlobalTableCell *cell = [GlobalTableCell settingCellWithTableView:tableView andCellStyle:UITableViewCellStyleDefault];
    cell.indexPath = indexPath;
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            ChangePassWordViewController *changePWVC = [[ChangePassWordViewController alloc] initWithNibName:@"ChangePassWordViewController" bundle:nil];
            [self.navigationController pushViewController:changePWVC animated:YES];
        }
            break;
        case 3:
        {
            MyCollectionTableViewController *myCollection = [[MyCollectionTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
            [self.navigationController pushViewController:myCollection animated:YES];
        }
            break;
        default:
            break;
    }
}

///返回
- (IBAction)handleBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
///设置
- (IBAction)handleSeeting:(UIButton *)sender {
    
}
///会员续费
- (IBAction)handleMembershipRenewal:(id)sender {
    
}
///推荐APP
- (IBAction)handleRecommendApp:(UIButton *)sender {
    
}
///我的证书
- (IBAction)handlePushToMyCertificate:(UIButton *)sender {
    MyCertificationViewController *myCertificate = [[MyCertificationViewController alloc] init];
    [self.navigationController pushViewController:myCertificate animated:YES];
}
///我的考试
- (IBAction)handlePuthToMyTest:(UIButton *)sender {
    
}
///我的培训
- (IBAction)handlePushToMyTrain:(UIButton *)sender {
    
}
-(void)viewDidLayoutSubviews
{
    if ([self.contentTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.contentTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.contentTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.contentTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end

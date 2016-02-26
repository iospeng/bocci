//
//  HomePageViewController.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/24.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableViewCell.h"
#import "HomePageModel.h"
#import "HomePageTableHeadView.h"
#import "UIBarButtonItem+CH.h"
#import "MemberCenterViewController.h"
#define KEachPageCount 10
#define KPage 1
@interface HomePageViewController () <DZNEmptyDataSetDelegate, DZNEmptyDataSetSource, UITableViewDataSource, UITableViewDelegate, HomePageTableHeadViewDelegate, SDCycleScrollViewDelegate>
{
   NSInteger _currentPage;
}
@property (nonatomic, strong) UITableView *contentTableView;
@property (nonatomic, strong) NSMutableArray *arrList;
@end
static NSString *const reuseIdentifier = @"HomePageTableViewCell";
@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupSubViews];
//    [self configureData];
    HomePageTableHeadView *headView = (HomePageTableHeadView *)self.contentTableView.tableHeaderView;
    [headView configureDataWithDic:nil];
}
- (void)setupSubViews {
    //1.tableView
    self.contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kUIScreenWidth, kUIScreenHeight-kTabBarHeight-kNavigationBarHeight) style:UITableViewStyleGrouped];
    _contentTableView.backgroundColor = kGlobalBg;
    _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentTableView.rowHeight = 90;
    _contentTableView.delegate = self;
    _contentTableView.dataSource = self;
    _contentTableView.emptyDataSetDelegate = self;
    _contentTableView.emptyDataSetSource = self;
    [self.view addSubview:self.contentTableView];
    [self.contentTableView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    //2.UIBarButtonItem
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithLeftIcon:@"Login_userName" highIcon:nil target:self action:@selector(handlePushToCenter)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(handleSearch)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    //tableHeadView
    HomePageTableHeadView *headView = [HomePageTableHeadView homePageTableHeadViewInit];
    headView.delegate = self;
    headView.headSDCycleScrollView.delegate = self;
    headView.height = 360*KProportionHeight;
    self.contentTableView.tableHeaderView = headView;
}
- (void)handlePushToCenter {
    MemberCenterViewController *membercenterVC = [[MemberCenterViewController alloc] init];
    membercenterVC.fd_prefersNavigationBarHidden = YES;
    [self.navigationController pushViewController:membercenterVC animated:YES];
}
- (void)handleSearch {
    
}
- (void)configureData {
    [self loadNewDataList];
    self.contentTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDataList)];
}
- (void)loadNewDataList {
    [self loadDataWithPage:1];
}
- (void)loadDataWithPage:(NSInteger)page {
    NSString *netPath = @"";
    NSMutableDictionary *allParameters = [NSMutableDictionary dictionary];
    [allParameters setObject:@"" forKey:@""];
    [HttpTool postWithPath:netPath params:allParameters success:^(id responseObj) {
        [self.contentTableView.mj_header endRefreshing];
        [self.contentTableView.mj_footer endRefreshing];
        [self reloadDataWithPage:page responseObj:responseObj];
    } failure:^(NSError *error) {
        [self.contentTableView.mj_header endRefreshing];
        [self.contentTableView.mj_footer endRefreshing];
    }];
}
- (void)reloadDataWithPage:(NSInteger)page responseObj:(NSDictionary *)responseObj {
    _currentPage = page;
    if (page == 1) {
        self.arrList = [NSMutableArray array];
    }
    NSInteger totalCount = [responseObj[@"total"] integerValue];
    for (NSDictionary *tempDic in responseObj[@"content"]) {
        HomePageModel *model = [HomePageModel mj_objectWithKeyValues:tempDic];
        [self.arrList addObject:model];
    }
    //headView数据
    HomePageTableHeadView *headView = (HomePageTableHeadView *)self.contentTableView.tableHeaderView;
    [headView configureDataWithDic:responseObj];
    //tableView数据
    [self.contentTableView reloadData];
    
    //判断是否添加上拉加载
    if (self.contentTableView.mj_footer == nil && totalCount > KEachPageCount *(page-1)+self.arrList.count) {
        self.contentTableView.mj_footer = [MJRefreshAutoNormalFooter  footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    } else {
        self.contentTableView.mj_footer = nil;
    }
}
- (void)loadMoreData {
    [self loadDataWithPage:_currentPage+1];
}
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
//    HomePageModel *model = self.arrList[indexPath.row];
//    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - HomePageTableHeadViewDelegate
- (void)clickHeadViewWithType:(clickBtnType)type {
    switch (type) {
        case clickBtnType_Ask:
        {
            
        }
            break;
        case clickBtnType_Listen:
        {
            
        }
            break;
        case clickBtnType_TalentHeadhunting:
        {
            
        }
            break;
        case clickBtnType_Finger:
        {
            
        }
            break;
        case clickBtnType_LoadNews:
        {
            
        }
            break;
        case clickBtnType_LoadNotification:
        {
            
        }
            break;
        case clickBtnType_LoadPost:
        {
            
        }
            break;
        default:
            break;
    }
}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    MyLog(@"点击轮播图");
}
#pragma mark - DZNEmptyDataSetDelegate, DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSMutableAttributedString *attribuStr = [[NSMutableAttributedString alloc] initWithString:@"暂无资讯"];
    [attribuStr addAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} range:NSMakeRange(0, attribuStr.length)];
    return attribuStr;
}
@end

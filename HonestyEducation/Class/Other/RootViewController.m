//
//  RootViewController.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/24.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "RootViewController.h"
#import "HomePageViewController.h"
#import "NetworkingAcademyViewController.h"
#import "LicenseManagementViewController.h"
#import "UserCenterViewController.h"
#import "MainNavigationController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildControllers];
}
#pragma mark 添加子视图控制器
- (void)addChildControllers {
    //返回主页
    HomePageViewController *homeVC = [[HomePageViewController alloc] init];
    [self addChildVC:homeVC vcTitle:@"一键通" tabBarItemTitle:@"返回主页" image:@"message_normal" selectedImage:@"message_check"];
    
    //网络学院
    NetworkingAcademyViewController *netWorkVC = [[NetworkingAcademyViewController alloc] init];
    [self addChildVC:netWorkVC vcTitle:@"网络学院" tabBarItemTitle:@"网络学院" image:@"contact_normal" selectedImage:@"contact_check"];
    
    //人证管理
    LicenseManagementViewController *licenseVC = [[LicenseManagementViewController alloc] init];
    [self addChildVC:licenseVC vcTitle:@"人证管理" tabBarItemTitle:@"人证管理" image:@"working_normal" selectedImage:@"working_check"];
    
    //用户中心
    UserCenterViewController *userVC = [[UserCenterViewController alloc] init];
    [self addChildVC:userVC vcTitle:@"用户中心" tabBarItemTitle:@"用户中心" image:@"mine_normal" selectedImage:@"mine_check"];

    
}
#pragma mark 添加子视图控制器详细方法
-(void)addChildVC:(UIViewController *)childVC
          vcTitle:(NSString *)vcTitle
  tabBarItemTitle:(NSString *)tabBarItemTitle
            image:(NSString *)image
    selectedImage:(NSString *)selectedImage {
    //title
    childVC.title = vcTitle;
    childVC.tabBarItem.title = tabBarItemTitle;
    //图片和选中图片
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置item底部的文字颜色
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //颜色设置可根据实际情况RGB值来定
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = RGBColor(49, 201, 155);
    
    [childVC.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVC.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 添加导航控制器
    MainNavigationController *naVC = [[MainNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:naVC];
}


@end

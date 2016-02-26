//
//  HomePageTableHeadView.h
//  HonestyEducation
//
//  Created by bocweb on 16/2/24.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>
typedef NS_ENUM(NSInteger, clickBtnType) {
    clickBtnType_Ask = 1,
    clickBtnType_Listen,
    clickBtnType_TalentHeadhunting,
    clickBtnType_Finger,
    clickBtnType_LoadNews,
    clickBtnType_LoadNotification,
    clickBtnType_LoadPost
};
@protocol HomePageTableHeadViewDelegate <NSObject>

- (void)clickHeadViewWithType:(clickBtnType)type;

@end

@interface HomePageTableHeadView : UIView
+ (instancetype)homePageTableHeadViewInit;

@property (nonatomic, assign) id<HomePageTableHeadViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet SDCycleScrollView *headSDCycleScrollView;
- (void)configureDataWithDic:(NSDictionary *)dic;

@end

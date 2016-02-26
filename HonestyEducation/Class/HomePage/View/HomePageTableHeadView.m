//
//  HomePageTableHeadView.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/24.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "HomePageTableHeadView.h"

@interface HomePageTableHeadView ()

@property (nonatomic, strong) NSMutableArray *linkArray;
@property (weak, nonatomic) IBOutlet UIView *slideView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *slideView_MarginLeft;

//默认第一个按钮选中
@property (weak, nonatomic) IBOutlet UIButton *defaultSelectBtn;

@property (nonatomic, strong) UIButton *selectedBtn;
@end

@implementation HomePageTableHeadView

+ (instancetype)homePageTableHeadViewInit {
    return [[[NSBundle mainBundle] loadNibNamed:@"HomePageTableHeadView" owner:nil options:nil] firstObject];
}
- (void)awakeFromNib {
    self.selectedBtn = self.defaultSelectBtn;
    self.defaultSelectBtn.selected = YES;
}
- (void)configureDataWithDic:(NSDictionary *)dic {
    //轮播图
    self.headSDCycleScrollView.placeholderImage = [UIImage imageNamed:@""];
//    NSMutableArray *photoArray = [NSMutableArray array];
//    self.linkArray = [NSMutableArray array];
//    for (NSDictionary *tempDic in dic[@"banner"]) {
//        [photoArray addObject:tempDic[@"photo"]];
//        [_linkArray addObject:tempDic[@"url"]];
//    }
    NSArray *photoArray = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf=425,260,50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w=400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    _headSDCycleScrollView.imageURLStringsGroup = photoArray;
    _headSDCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _headSDCycleScrollView.currentPageDotColor = [UIColor whiteColor];
 
    //按钮
    
    
}


//建设咨询
- (IBAction)handlePushToAsk:(UIButton *)sender {
    [self addWaterAnimationWithBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_Ask];
    }
}
//免费试听
- (IBAction)handlePushToListen:(UIButton *)sender {
    [self addWaterAnimationWithBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_Listen];
    }
}
//人才猎头
- (IBAction)HandlePushToTalentHeadhunting:(UIButton *)sender {
     [self addWaterAnimationWithBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_TalentHeadhunting];
    }
}
//查询服务
- (IBAction)handlePushFinger:(UIButton *)sender {
     [self addWaterAnimationWithBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_Finger];
    }
}
//行业新闻
- (IBAction)handleLoadNews:(UIButton *)sender {
     [self slideViewtoBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_LoadNews];
    }
}
//报名通知
- (IBAction)handleLoadNotification:(UIButton *)sender {
     [self slideViewtoBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_LoadNotification];
    }
}
//公告发布
- (IBAction)handleLoadPost:(UIButton *)sender {
     [self slideViewtoBtn:sender];
    if ([self.delegate respondsToSelector:@selector(clickHeadViewWithType:)]) {
        [self.delegate clickHeadViewWithType:clickBtnType_LoadPost];
    }
}
- (void)addWaterAnimationWithBtn:(UIButton *)btn {
    CATransition *transition = [CATransition animation];
    transition.duration = 1.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = @"rippleEffect";
    [btn.layer addAnimation:transition forKey:nil];
}
- (void)slideViewtoBtn:(UIButton *)toBtn {
    if ([self.selectedBtn isEqual:toBtn])return;
    self.selectedBtn.selected = NO;
    toBtn.selected = YES;

    POPBasicAnimation *positionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:self.selectedBtn.center];
    positionAnimation.toValue = [NSValue valueWithCGPoint:toBtn.center];
    [self.slideView.layer pop_addAnimation:positionAnimation forKey:@"opacityAnimation"];
    
    self.selectedBtn = toBtn;
}

@end

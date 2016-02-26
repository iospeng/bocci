//
//  RootViewController.h
//  TestDemo
//
//  Created by 李里 on 14-8-20.
//  Copyright (c) 2014年  李里 www.lanou3g.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICETutorialPage.h"


// Scrolling state.
typedef NS_OPTIONS(NSUInteger, ScrollingState) {
    ScrollingStateAuto      = 1 << 0,
    ScrollingStateManual    = 1 << 1,
    ScrollingStateLooping   = 1 << 2,
};

typedef void (^ButtonBlock)(UIButton *button);


@interface ICETutorialController : UIViewController<UIScrollViewDelegate>



{
    CGSize _windowSize;
    ScrollingState _currentState;
    NSArray *_pages;
    int _currentPageIndex;
    ICETutorialLabelStyle *_commonPageSubTitleStyle;
    ICETutorialLabelStyle *_commonPageDescriptionStyle;
    
   
}
/**
 *  六鱼财富是否展示引导页
 */
@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, retain)NSArray * pages;

@property (nonatomic,retain) UIImageView *  backLayerView;

@property (nonatomic,retain) UIImageView *  frontLayerView;


@property (nonatomic,retain) UIScrollView * scrollView;

@property (nonatomic,retain) UIPageControl * pageControl;

@property (nonatomic,retain) UIButton * abutton;


@property (nonatomic, assign) CGFloat autoScrollDurationOnPage;
@property (nonatomic, retain) ICETutorialLabelStyle *commonPageSubTitleStyle;
@property (nonatomic, retain) ICETutorialLabelStyle *commonPageDescriptionStyle;

// Inits.

- (id)initWithNibandPages:(NSArray *)pages;



// Pages management.
- (void)setPages:(NSArray*)pages;
- (NSUInteger)numberOfPages;

@end

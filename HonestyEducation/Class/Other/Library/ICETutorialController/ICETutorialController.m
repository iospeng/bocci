//
//  RootViewController.m
//  TestDemo
//
//  Created by 李里 on 14-8-20.
//  Copyright (c) 2014年  李里 www.lanou3g.com. All rights reserved.
//

#import "ICETutorialController.h"
#define kWidth   [UIScreen mainScreen].bounds.size.width
#import "RootViewController.h"
#import "MainNavigationController.h"
@interface ICETutorialController ()

@end

@implementation ICETutorialController
@synthesize autoScrollDurationOnPage = _autoScrollDurationOnPage;
@synthesize commonPageSubTitleStyle = _commonPageSubTitleStyle;
@synthesize commonPageDescriptionStyle = _commonPageDescriptionStyle;



- (id)initWithNibandPages:(NSArray *)pages;{
  
    if (self){
        _pages = pages;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     _windowSize = [[UIScreen mainScreen] bounds].size;
    // Do any additional setup after loading the view.
    self.backLayerView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, [UIScreen mainScreen].bounds.size.height)];
    _backLayerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_backLayerView];

    self.frontLayerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_frontLayerView];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kWidth, [UIScreen mainScreen].bounds.size.height)];
    [_scrollView setContentSize:CGSizeMake([self numberOfPages] * _windowSize.width,
                                           _scrollView.contentSize.height)];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [_scrollView setPagingEnabled:YES];
      NSLog(@"%@", NSStringFromCGSize(_scrollView.contentSize));
    [self.view addSubview:_scrollView];

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 60, [UIScreen mainScreen].bounds.size.height * 0.78, 120, 36)];
   
    // PageControl configuration.
    [_pageControl setNumberOfPages:[self numberOfPages]];
    [_pageControl setCurrentPage:0];
    [self.view addSubview:_pageControl];
 
    // Preset the origin state.
    [self setOriginLayersState];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Pages
// Set the list of pages (ICETutorialPage)
- (void)setPages:(NSArray *)pages{
    _pages = pages;
}

- (NSUInteger)numberOfPages{
    if (_pages)
        return [_pages count];
    NSLog(@"%zd",[_pages count]);
    return 0;
}


#pragma mark - Layers management
// Handle the background layer image switch.
- (void)setBackLayerPictureWithPageIndex:(NSInteger)index{
    [self setBackgroundImage:_backLayerView withIndex:index + 1];
}

// Handle the front layer image switch.
- (void)setFrontLayerPictureWithPageIndex:(NSInteger)index{
    [self setBackgroundImage:_frontLayerView withIndex:index];
}

// Handle page image's loading
- (void)setBackgroundImage:(UIImageView *)imageView withIndex:(NSInteger)index{
    NSLog(@"index = %zd",index);
    
     NSLog(@"_pages = %zd",[_pages count]);
    if (index >= [_pages count]){
        
        if (index == [_pages count]) {
            self.abutton = [UIButton buttonWithType:UIButtonTypeSystem];
//            _abutton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 60, [UIScreen mainScreen].bounds.size.height * 0.75, 120, 30);
            _abutton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 60, _pageControl.y + 10, 120, 40);
        //[_abutton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            _abutton.tintColor = [UIColor whiteColor];
            _abutton.layer.cornerRadius = 5;
            _abutton.layer.masksToBounds = YES;

           [_abutton setTitle:@"进入六鱼财富" forState:UIControlStateNormal];
            [_abutton addTarget:self action:@selector(startPageFunction) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_abutton];
        }
        
        [imageView setImage:nil];
        return;
    }
    
    
    
    NSString *imageName = [NSString stringWithFormat:@"%@",[[_pages objectAtIndex:index] pictureName]];
    [imageView setImage:[UIImage imageNamed:imageName]];
}

#pragma mark startPageFunction
- (void)startPageFunction
{
    //    RootControllerZQ *recommand = [[RootControllerZQ alloc] init];
    //    recommand.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //    [self presentViewController:recommand animated:YES completion:^{
    //
    //    }];
    //    RootViewController *rootVC = [[RootViewController alloc] init];
}
- (void)popSelf {
    [self.navigationController popViewControllerAnimated:YES];
}

// Setup layer's alpha.
- (void)setLayersPrimaryAlphaWithPageIndex:(NSInteger)index{
    [_frontLayerView setAlpha:1];
    [_backLayerView setAlpha:0];
}

// Preset the origin state.
- (void)setOriginLayersState{
    _currentState = ScrollingStateAuto;
    [_backLayerView setBackgroundColor:[UIColor blackColor]];
    [_frontLayerView setBackgroundColor:[UIColor blackColor]];
    [self setLayersPicturesWithIndex:0];
}

// Setup the layers with the page index.
- (void)setLayersPicturesWithIndex:(NSInteger)index{
    _currentPageIndex = (int)index;
    [self setLayersPrimaryAlphaWithPageIndex:index];
    [self setFrontLayerPictureWithPageIndex:index];
    [self setBackLayerPictureWithPageIndex:index];
}

// Animate the fade-in/out (Cross-disolve) with the scrollView translation.
- (void)disolveBackgroundWithContentOffset:(float)offset{
    if (_currentState & ScrollingStateLooping){
        // Jump from the last page to the first.
        [self scrollingToFirstPageWithOffset:offset];
    } else {
        // Or just scroll to the next/previous page.
        [self scrollingToNextPageWithOffset:offset];
    }
}

// Handle alpha on layers when the auto-scrolling is looping to the first page.
- (void)scrollingToFirstPageWithOffset:(float)offset{
    // Compute the scrolling percentage on all the page.
    offset = (offset * _windowSize.width) / (_windowSize.width * [self numberOfPages]);
    
    // Scrolling finished...
    if (offset == 0){
        // ...reset to the origin state.
        [self setOriginLayersState];
        return;
    }
    
    // Invert alpha for the back picture.
    float backLayerAlpha = (1 - offset);
    float frontLayerAlpha = offset;
    
    // Set alpha.
    [_backLayerView setAlpha:backLayerAlpha];
    [_frontLayerView setAlpha:frontLayerAlpha];
}

// Handle alpha on layers when we are scrolling to the next/previous page.
- (void)scrollingToNextPageWithOffset:(float)offset{
    // Current page index in scrolling.
    NSInteger page = (int)(offset);
    
    // Keep only the float value.
    float alphaValue = offset - (int)offset;
    
    // This is only when you scroll to the right on the first page.
    // That will fade-in black the first picture.
    if (alphaValue < 0 && _currentPageIndex == 0){
        [_backLayerView setImage:nil];
        [_frontLayerView setAlpha:(1 + alphaValue)];
        return;
    }
    
    // Switch pictures, and imageView alpha.
    if (page != _currentPageIndex)
    {
        [self setLayersPicturesWithIndex:page];
    }
    
    // Invert alpha for the front picture.
    float backLayerAlpha = alphaValue;
    float frontLayerAlpha = (1 - alphaValue);
    
    // Set alpha.
    [_backLayerView setAlpha:backLayerAlpha];
    [_frontLayerView setAlpha:frontLayerAlpha];
}

#pragma mark - ScrollView delegate

//控制滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Get scrolling position, and send the alpha values.
    float scrollingPosition = scrollView.contentOffset.x / _windowSize.width;
    [self disolveBackgroundWithContentOffset:scrollingPosition];
    
    if (_scrollView.isTracking)
        _currentState = ScrollingStateManual;
}


//UIPageController的点
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // Update the page index.
    [_pageControl setCurrentPage:_currentPageIndex];
}

@end

//
//  UIBarButtonItem+CH.m
//  新闻
//
//  Created by Think_lion on 15/5/4.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import "UIBarButtonItem+CH.h"
#import "UIImage+CH.h"
@implementation UIBarButtonItem (CH)
//设置左边按钮
+(UIBarButtonItem *)itemWithLeftIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *btn=[[UIButton alloc]init];
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片左移10
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [btn setImage:[UIImage resizedImage:icon] forState:UIControlStateNormal];

  //  [btn setImage:[UIImage resizedImage:highIcon] forState:UIControlStateHighlighted];
//    btn.frame=CGRectMake(0, 20, btn.currentImage.size.width, btn.currentImage.size.height);
    btn.frame=CGRectMake(0, 20, 30, 30);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
//设置右边按钮
+(UIBarButtonItem *)itemWithRightIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action
{
    UIButton *btn=[[UIButton alloc]init]; 
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片左移15
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [btn setImage:[UIImage resizedImage:icon] forState:UIControlStateNormal];
   // [btn setImage:[UIImage resizedImage:highIcon] forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(0, 20, btn.currentImage.size.width, btn.currentImage.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(UIBarButtonItem *)itemWithLeftIcon:(NSString *)icon highIcon:(NSString *)highIcon edgeInsets:(UIEdgeInsets )edgeInsets target:(id)target action:(SEL)action
{
    UIButton *btn=[[UIButton alloc]init];
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片左移15
    [btn setImageEdgeInsets:edgeInsets];
    [btn setImage:[UIImage resizedImage:icon] forState:UIControlStateNormal];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btn.titleEdgeInsets = UIEdgeInsetsMake(edgeInsets.top, edgeInsets.left+5, edgeInsets.bottom, edgeInsets.right-5);
    //  [btn setImage:[UIImage resizedImage:highIcon] forState:UIControlStateHighlighted];
    btn.frame=CGRectMake(0, 20, 50, btn.currentImage.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}
//设置按钮文字
+(UIBarButtonItem *)itemWithLeftTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    btn.titleLabel.font=[UIFont systemFontOfSize:15];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, -10, 0, 10);
    
    UIBarButtonItem  *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}
//导航栏右边按钮的添加  包括设置距离
+(UIBarButtonItem*)itemWithRightIcon:(NSString *)icon highIcon:(NSString*)highIcon  edgeInsets:(UIEdgeInsets)edgeInsets  target:(id)target action:(SEL)action {
    UIButton *btn=[[UIButton alloc]init];
    // 这里需要注意：由于是想让图片右移，所以left需要设置为正，right需要设置为负。正在是相反的。
    // 让按钮图片左移15
    [btn setImageEdgeInsets:edgeInsets];
    [btn setImage:[UIImage resizedImage:icon] forState:UIControlStateNormal];
//    [btn setTitle:@"(评论)" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    btn.frame=CGRectMake(kUIScreenWidth, 20, btn.currentImage.size.width, btn.currentImage.size.height);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}
+(UIBarButtonItem*)itemWithRightTitle:(NSString*)title target:(id)target action:(SEL)action {
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(kUIScreenWidth - 20, 0, 50, 30)];
    btn.titleLabel.font=[UIFont systemFontOfSize:15];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, -10);
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    UIBarButtonItem  *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;
}
@end

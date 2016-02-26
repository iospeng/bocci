//
//  HTTPResponseItem.h
//  BocGuest
//
//  Created by Remmo on 15/11/2.
//  Copyright © 2015年 bocweb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPResponseItem : NSObject

@property (nonatomic, copy) NSString  *timeline;
@property (nonatomic, copy) NSString  *returnInfo;
@property (nonatomic, copy) NSString  *returnNo;
@property (nonatomic, assign) BOOL  secure;
@property (nonatomic, strong) id  content;

@end

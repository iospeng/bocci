//
//  UserInfo.h
//  
//
//  Created by bocweb on 15/11/30.
//
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@interface UserInfo : NSObject

single_interface(UserInfo)

@property (nonatomic, strong) NSDictionary *userInfo;//存储用户登录信息

@property (nonatomic, strong) NSDictionary *changeGroupNameDic;

@end

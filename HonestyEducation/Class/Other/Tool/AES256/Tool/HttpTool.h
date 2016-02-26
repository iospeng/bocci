//
//  HttpTool.h
//  TJProperty
//
//  Created by Remmo on 15/6/24.
//  Copyright (c) 2015年 bocweb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

/**
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */

/**
 * post请求
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;


//+ (void)postUpDataWithPath:(NSString *)path params:(NSDictionary *)params fileName:(NSString *)fileName success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
//
+ (void)postUpDataWithPath:(NSString *)path params:(NSDictionary *)params fileData:(NSData *)fileData fileName:(NSString *)fileName success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

@end

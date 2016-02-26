//
//  HttpTool.m
//  TJProperty
//
//  Created by Remmo on 15/6/24.
//  Copyright (c) 2015年 bocweb. All rights reserved.
//

#import "HttpTool.h"
#import "BaseHttpTool.h"
#import "NSString+Hash.h"
#import "NSData+Encryption.h"
#import "HTTPResponseItem.h"
static NSString *const bocKeys = @"taiduomi";

@interface HttpTool ()

@end

@implementation HttpTool
/**
 * POST请求
 */
+ (void)postWithPath:(NSString *)path params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{
    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseURL,path];
    [BaseHttpTool post:netPath params:params success:success failure:failure];
}


#pragma mark - 上传文件网络请求
//+ (void)postUpDataWithPath:(NSString *)path params:(NSDictionary *)params fileName:(NSString *)fileName success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {
//    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseURL,path];
//    NSData *data = params[@"inputfile"];
////    [BaseHttpTool uploadFileWithPath:netPath name:fileName fileData:data params:params success:success failure:failure];
//    [BaseHttpTool post:netPath params:params success:success failure:failure];
//}
+ (void)postUpDataWithPath:(NSString *)path params:(NSDictionary *)params fileData:(NSData *)fileData fileName:(NSString *)fileName success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {
    NSString *netPath = [NSString stringWithFormat:@"%@/%@",kBaseURL,path];
    [BaseHttpTool uploadFileWithPath:netPath name:fileName fileData:fileData params:params success:success failure:failure];
}
@end

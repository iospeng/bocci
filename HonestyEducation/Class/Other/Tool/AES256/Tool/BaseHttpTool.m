//
//  BaseHttpTool.m
//  TJProperty
//
//  Created by Remmo on 15/6/24.
//  Copyright (c) 2015年 bocweb. All rights reserved.
//

#import "BaseHttpTool.h"
#import "AFNetworking.h"

@implementation BaseHttpTool
+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", @"----------V2ymHFg03ehbqgZCaKO6jy"];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",  @"text/javascript",  contentType , nil];

//    if ([url rangeOfString:@"sendOtherMsg"].location != NSNotFound) {
//            MyLog(@"%@", params);
//            mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
//            mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
//    }
    MyLog(@"_+______%@", params);
    // 2.发送POST请求
    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObj) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
//        if ([url rangeOfString:@"sendOtherMsg"].location != NSNotFound) {
//            NSString *result = [[NSString alloc] initWithData:responseObj encoding:NSUTF8StringEncoding];
//            MyLog(@"______result  *******(%@", result);
//            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//            if (success) {
//                success(result);
//            }
//            return ;
//        }
        MyLog(@"url:%@___responseObj:%@", url,responseObj);
        if (success) {
            success(responseObj);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [MBProgressHUD showError:@"网络不给力"];
        if (failure) {
            failure(error);
        }
    }];
}

//+ (void)postUpdataURL:(NSString *)url params:(NSDictionary *)params fileName:(NSString *)fileName success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure {
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    // 1.获得请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",  @"text/javascript", nil];
//    
//    NSData *data = params[@"inputfile"];
//    NSArray *fileNameArray = [fileName componentsSeparatedByString:@"."];
//    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        [formData appendPartWithFileData:data name:fileNameArray.firstObject fileName:fileNameArray.lastObject mimeType:@"application/file"];
//    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    }];
//}
//小椿传的
+ (void)uploadFileWithPath:(NSString *)url name:(NSString *)name fileData:(NSData *)fileData params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
{

//    NSArray *fileNameArray = [name componentsSeparatedByString:@"."];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:fileData name:name fileName:name mimeType:@"image/jpeg/3gp/file"];
    } error:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        MyLog(@"111111");
        float rate=((totalBytesWritten*1.0)/(totalBytesExpectedToWrite*1.0));
        NSString * str=[NSString stringWithFormat:@"%d",(int)(rate*100)];
        MyLog(@"****%@,,%f", str, rate);
        if (rate >=1) {
            MyLog(@"上传完成");
        }
    }];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        id s=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(s);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (operation.response.statusCode==200) {
        } else {
        }
    }];
    [operation start];
}
//+ (void)uploadFileWithPath:(NSString *)url name:(NSString *)name fileData:(NSData *)fileData params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure
//{
//    NSArray *fileNameArray = [name componentsSeparatedByString:@"."];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", @"text/javascript", nil];
//    
//    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            [formData appendPartWithFileData:fileData name:name fileName:fileName mimeType:@"image/jpg/file"];
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success) {
//            success(responseObject);
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//
//}
@end

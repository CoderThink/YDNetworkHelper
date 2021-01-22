//
//  YDHTTPRequest.m
//  Music
//
//  Created by Kiki on 2017/4/17.
//  Copyright © 2017年 Kiki. All rights reserved.
//

#import "YDHTTPRequest.h"
#import "YDInterfacedConst.h"
#import "YDNetworkHelper.h"
#import "YDHTTPResponse.h"

@implementation YDHTTPRequest

+ (void)initialize
{
    [YDNetworkHelper openLog];
    [YDNetworkHelper setRequestTimeoutInterval:15];
    [YDNetworkHelper setRequestSerializer:YDRequestSerializerJSON];
}

+ (NSURLSessionTask *)getHomeWithParameters:(id)params success:(YDRequestSuccess)success failure:(YDRequestFailure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@",kApiPrefix,kHome];
    return [self requestGetWithURL:url parameters:params success:success failure:failure];
}

+ (void)setToken {
//    if ([MHUserModel account].loginStatus) {
//        [YDNetworkHelper setValue:[MHUserModel account].token forHTTPHeaderField:@"token"];
//    }else{
//        [YDNetworkHelper setValue:@"" forHTTPHeaderField:@"token"];
//    }
}

#pragma mark - 请求的公共方法

+ (NSURLSessionTask *)requestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    NSLog(@"请求路径:%@",URL);
    return [YDNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else if(response.status == YDHTTPResponseStatusUnauthorized){
//            [MHUserModel loginExpired];
        }else{
            failure(response.msg);
        }
        
    } failure:^(NSError *error) {
        failure(@"网络连接错误,请稍后再试");//error.userInfo[@"NSLocalizedDescription"]
    }];
}

+ (NSURLSessionTask *)requestWithUrl:(NSString *)URL parameters:(NSDictionary *)parameter cache:(YDHttpRequestCache)cache  success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    return [YDNetworkHelper POST:URL parameters:parameter responseCache:^(id responseCache) {
        cache(responseCache);
    }  success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else if(response.status == YDHTTPResponseStatusUnauthorized){
//            [MHUserModel loginExpired];
        }else{
            failure(response.msg);
        }
    } failure:^(NSError *error) {
        failure(error.userInfo[@"NSLocalizedDescription"]);
    }];
}

+ (NSURLSessionTask *)requestGetWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    return [YDNetworkHelper GET:URL parameters:parameter  success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else if(response.status == YDHTTPResponseStatusUnauthorized){
            success(response);
        }else{
            failure(response.msg);
        }
    } failure:^(NSError *error) {
        failure(error.userInfo[@"NSLocalizedDescription"]);
    }];
}

+ (NSURLSessionTask *)requestPutWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    return [YDNetworkHelper PUT:URL parameters:parameter success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else if(response.status == YDHTTPResponseStatusUnauthorized){
//            [MHUserModel loginExpired];
        }else{
            failure(response.msg);
        }
    } failure:^(NSError *error) {
        failure(error.userInfo[@"NSLocalizedDescription"]);
    }];
}

+ (NSURLSessionTask *)requestDeleteWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    return [YDNetworkHelper DELETE:URL parameters:parameter success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else if(response.status == YDHTTPResponseStatusUnauthorized){
//            [MHUserModel loginExpired];
        }else{
            failure(response.msg);
        }
    } failure:^(NSError *error) {
        failure(error.userInfo[@"NSLocalizedDescription"]);
    }];
}

/**
 上传图片
 
 @param URL 请求路径
 @param parameter 参数
 @param name 名称
 @param images 图片数组
 @param fileNames 文件名称数组
 @param imageScale 图片缩放比例
 @param imageType 图片类型
 @param success 成功
 @param failure 失败
 @return 当前请求任务
 */

+ (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL parameters:(NSDictionary *)parameter name:(NSString *)name images:(NSArray *)images fileNames:(NSArray *)fileNames  imageScale:(CGFloat)imageScale imageType:(NSString *)imageType
                                  success:(YDHttpRequestSuccess)success failure:(YDRequestFailure)failure
{
    [self setToken];
    // 发起请求
    return [YDNetworkHelper uploadImagesWithURL:URL parameters:parameter name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:nil success:^(id responseObject) {
        YDHTTPResponse *response = [self createResponseWithResponseObject:responseObject];
        
        if (response.status == YDHTTPResponseStatusSuccess) {
            success(response);
        }else{
            failure(response.msg);
        }
        
    } failure:^(NSError *error) {
        failure(error.userInfo[@"NSLocalizedDescription"]);
    }];
}

+ (YDHTTPResponse *)createResponseWithResponseObject:(id)responseObject
{
    YDHTTPResponse *response = [[YDHTTPResponse alloc] init];
    if (responseObject) {
                response.total = [responseObject[@"total"] integerValue];
                response.data = responseObject[@"data"];
                response.msg = responseObject[@"message"];
                response.status = [responseObject[@"code"] integerValue];
//        response = [YDHTTPResponse mj_objectWithKeyValues:responseObject];
    }
    return response;
}
@end

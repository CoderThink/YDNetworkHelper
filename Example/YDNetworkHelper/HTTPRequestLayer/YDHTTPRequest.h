//
//  YDHTTPRequest.h
//  Music
//
//  Created by Kiki on 2017/4/17.
//  Copyright © 2017年 Kiki. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YDHTTPResponse;

typedef NS_ENUM(NSInteger,RequestType) {
    RequestTypeLoadMore=0,
    RequestTypeRefresh
};

/**
 请求缓存的block
 
 @param responseCache 缓存信息
 */
typedef void(^YDRequestCache)(id responseCache);

/**
 请求成功的Block
 
 @param responseObject 响应体数据
 */
typedef void(^YDRequestSuccess)(YDHTTPResponse *responseObject);


/**
 请求失败的Block
 
 @param error 错误信息
 */
typedef void(^YDRequestFailure)(NSString *error);

@interface YDHTTPRequest : NSObject

+ (YDHTTPResponse *)createResponseWithResponseObject:(id)responseObject;

/** 获取首页数据 */
+ (NSURLSessionTask *)getHomeWithParameters:(id)params success:(YDRequestSuccess)success failure:(YDRequestFailure)failure;

@end

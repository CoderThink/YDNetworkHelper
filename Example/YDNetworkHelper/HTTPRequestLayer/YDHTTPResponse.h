//
//  YDHTTPResponse.h
//  Music
//
//  Created by Kiki on 2017/4/17.
//  Copyright © 2017年 Kiki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,YDHTTPResponseStatus) {
    YDHTTPResponseStatusSuccess = 200,
    YDHTTPResponseStatusUnauthorized = 401,
    YDHTTPResponseStatusForbidden = 403,
    YDHTTPResponseStatusNotFound = 404
//    YDHTTPResponseStatusNoBinding   // 未绑定微信
};

@interface YDHTTPResponse : NSObject
@property (nonatomic,assign) YDHTTPResponseStatus status;
@property (nonatomic, strong) id data;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger total;
@end


//
//  YDInterfacedConst.m
//  YDNetworkHelper_Example
//
//  Created by Think on 2021/1/21.
//  Copyright © 2021 yangdong@163.com. All rights reserved.
//

#import "YDInterfacedConst.h"

#if DevelopServer
    NSString *const kApiPrefix = @"http://192.168.3.129:9000/api";
#elif TestServer
    NSString *const kApiPrefix = @"http://47.115.190.174:9000/api";
#elif ProductServer
    NSString *const kApiPrefix = @"https://www.alphamusic.io/api";
#endif

/** 登录 */
NSString *const kHome = @"/v2/portal/details";

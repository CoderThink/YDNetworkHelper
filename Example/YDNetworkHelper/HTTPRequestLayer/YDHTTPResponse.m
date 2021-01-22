//
//  YDHTTPResponse.m
//  Music
//
//  Created by Kiki on 2017/4/17.
//  Copyright © 2017年 Kiki. All rights reserved.
//

#import "YDHTTPResponse.h"

@implementation YDHTTPResponse

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id",@"status":@"code"};
}

@end


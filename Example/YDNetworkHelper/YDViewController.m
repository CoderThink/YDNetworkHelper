//
//  YDViewController.m
//  YDNetworkHelper
//
//  Created by yangdong@163.com on 06/01/2020.
//  Copyright (c) 2020 yangdong@163.com. All rights reserved.
//

#import "YDViewController.h"
#import "YDHTTPRequest.h"
#import "YDHTTPResponse.h"

@interface YDViewController ()

@end

@implementation YDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"1");
//        sleep(1);
//        dispatch_semaphore_signal(semaphore);
//    });
//    NSLog(@"2");
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    NSLog(@"3");
    
	
    [self getData];
}

- (void)getData{


    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"pageNum"] = @(1);
    params[@"pageSize"] = @(20);
    [YDHTTPRequest getHomeWithParameters:params success:^(YDHTTPResponse *responseObject) {
        NSLog(@"%@",responseObject.data);
    } failure:^(NSString *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

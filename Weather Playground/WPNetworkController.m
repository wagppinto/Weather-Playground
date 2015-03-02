//
//  WPNetworkController.m
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPNetworkController.h"
#import <AFNetworking/AFNetworking.h>

@implementation WPNetworkController
+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [AFHTTPSessionManager new];
        
        api = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        
    });
    return api;
}

@end

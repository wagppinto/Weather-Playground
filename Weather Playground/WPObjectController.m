//
//  WPObjectController.m
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPObjectController.h"
#import "WPWeather.h"
#import "WPNetworkController.h"
#import <AFNetworking/AFNetworking.h>


@implementation WPObjectController

+ (WPObjectController *)sharedInstance {
    static WPObjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WPObjectController new];
        
    });
    return sharedInstance;
}
- (void)getWeatherWithName:(NSString *)name completion:(void (^)(NSArray *weather))completion{
    
    NSString *path = [NSString stringWithFormat:@"name//%@",name];
    
    [[WPNetworkController api]GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *responseWeather = responseObject;
        
        NSMutableArray *places = [NSMutableArray array];
        for (NSDictionary *dictionary in responseWeather) {
            WPWeather *weather = [[WPWeather alloc]initWithDictionary:dictionary];
            [places addObject:weather];
        }
        completion(places);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@" error: %@", error);
        completion(nil);
    }];
    
}


@end

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

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(WPWeather *weather))completion{
    
        NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
        [[WPNetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject)
         {
             NSLog(@"getWeatherWithName: %@", responseObject);
             NSDictionary *responseCountry = responseObject;
             WPWeather *weatherObject = [[WPWeather alloc] initWithDictionary:responseCountry];
             completion(weatherObject);
         }
        
        failure:^(NSURLSessionDataTask *task, NSError *error)
         {
             NSLog(@"ERROR: %@", error);
             completion(nil);
         }
         ];
    }

@end

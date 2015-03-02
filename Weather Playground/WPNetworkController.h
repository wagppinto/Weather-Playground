//
//  WPNetworkController.h
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface WPNetworkController : NSObject

+ (AFHTTPSessionManager *)api;

@end

//
//  WPObjectController.h
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPWeather.h"

@interface WPObjectController : NSObject

+ (WPObjectController *)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(NSArray *weather))completion;


@end

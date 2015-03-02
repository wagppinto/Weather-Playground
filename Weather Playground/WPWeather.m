//
//  WPWeather.m
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPWeather.h"


////locationName, weatherMain, weatherDescription, weatherIcon, weatherTemp
static NSString * const locationNameKey = @"Name";
static NSString * const weatherMainKey = @"main";
static NSString * const weatherDescriptionKey = @"description";
static NSString * const weatherIconKey = @"icon";
static NSString * const weatherTempKey= @"temp";

@implementation WPWeather


-(instancetype)initWithDictionary: (NSDictionary *)dictionary{
    self = [super init];
    
    if (self) {
        self.locationName = dictionary[@"Name"];
        self.weatherMain = dictionary[@"weather"][0][@"main"];
        self.weatherDescription = dictionary[@"weather"][0][@"description"];
        self.weatherIcon = dictionary[@"weather"][0][@"icon"];
        self.weatherTemp = dictionary[@"main"][@"temp"];    }
    return self;
}

@end

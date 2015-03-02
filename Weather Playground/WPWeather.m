//
//  WPWeather.m
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WPWeather.h"


//locationName, weatherMain, weatherDescription, weatherIcon, weatherTemp
static NSString * const locationNameKey = @"localName";
static NSString * const weatherMainKey = @"weatherMain";
static NSString * const weatherDescriptionKey = @"weatherDescription";
static NSString * const weatherIconKey = @"weatherIcon";
static NSString * const weatherTempKey= @"weatherTemp";

@implementation WPWeather


-(instancetype)initWithDictionary: (NSDictionary *)dictionary{
    self = [super init];
    
    if (self) {
        self.locationName = dictionary[locationNameKey];
        self.weatherMain = dictionary[weatherMainKey];
        self.weatherDescription = dictionary[weatherDescriptionKey];
        self.weatherIcon = dictionary[weatherIconKey];
        self.weatherTemp = dictionary[weatherTempKey];
    }
    return self;
}

@end

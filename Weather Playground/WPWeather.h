//
//  WPWeather.h
//  Weather Playground
//
//  Created by Wagner Pinto on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WPWeather : NSObject

//locationName, weatherMain, weatherDescription, weatherIcon, weatherTemp
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *weatherMain;
@property (nonatomic, strong) NSString *weatherDescription;
@property (nonatomic, strong) NSString *weatherIcon;
@property (nonatomic, strong) NSString *weatherTemp;


-(instancetype)initWithDictionary: (NSDictionary *)dictionary;


@end

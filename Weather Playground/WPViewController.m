//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WPNetworkController.h"
#import "WPObjectController.h"
#import "WPWeather.h"
#import "UIImageView+AFNetworking.h"


@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end

@implementation WPViewController
- (IBAction)getWeather:(id)sender {

        [[WPObjectController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:
         ^(WPWeather *weather)
         {
             self.nameLabel.text = weather.locationName;
             self.tempLabel.text = [NSString stringWithFormat:@"%.1fº C", [self celsiusFromKelvinString:weather.weatherTemp]];
             self.mainLabel.text = weather.weatherMain;
             self.descLabel.text = weather.weatherDescription;
             
             NSString *iconString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weather.weatherIcon];
             NSURL *iconURL = [NSURL URLWithString:iconString];
             [self.weatherIcon setImageWithURL:iconURL];
         }];
}


- (double)celsiusFromKelvinString:(NSString *)kelvin
{
    double kelvinDouble = [kelvin doubleValue];
    return kelvinDouble - 273.15;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ForecastData.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#define FORECAST_ICON_CLEARDAY = @"clear-day"
#define FORECAST_ICON_CLEARNIGHT = @"clear-night"
#define FORECAST_ICON_RAIN = @"rain"
#define FORECAST_ICON_SNOW = @"snow"
#define FORECAST_ICON_SLEET = @"sleet"
#define FORECAST_ICON_WIND = @"wind"
#define FORECAST_ICON_FOG = @"fog"
#define FORECAST_ICON_CLOUDY = @"cloudy"
#define FORECAST_ICON_PARTLYCLOUDYDAY = @"partly-cloudy-day"
#define FORECAST_ICON_PARTLYCLOUDYNIGHT = @"partly-cloudy-night"
#define FORECAST_ICON_HAIL = @"hail"
#define FORECAST_ICON_THUNDERSTORM = @"thunderstorm"
#define FORECAST_ICON_TORNADO = @"tornado"

#import <Foundation/Foundation.h>

@interface ForecastData : NSObject

@property (nonatomic, strong) NSString* cloudCover;
@property (nonatomic, strong) NSString* dewPoint;
@property (nonatomic, strong) NSString* humidity;
@property (nonatomic, strong) NSString* icon;
@property (nonatomic, strong) NSString* ozone;
@property (nonatomic, strong) NSString* precipIntensity;
@property (nonatomic, strong) NSString* precipIntensityMax;
@property (nonatomic, strong) NSString* pressure;
@property (nonatomic, strong) NSString* summary;
@property (nonatomic, strong) NSDate* sunriseTime;
@property (nonatomic, strong) NSDate* sunsetTime;
@property (nonatomic, strong) NSString* temperature;
@property (nonatomic, strong) NSString* temperatureMax;
@property (nonatomic, strong) NSDate* temperatureMaxTime;
@property (nonatomic, strong) NSString* temperatureMin;
@property (nonatomic, strong) NSDate* temperatureMinTime;
@property (nonatomic, strong) NSDate* time;
@property (nonatomic, strong) NSString* windBearing;
@property (nonatomic, strong) NSString* windSpeed;

-(id)initWithData:(NSDictionary*)data;

-(NSString*)sunriseTimeString;
-(NSString*)sunsetTimeString;
-(NSString*)temperatureMaxTimeString;
-(NSString*)temperatureMinTimeString;
-(NSString*)dateString;
-(NSString*)dateFullString;
-(NSString*)timeString;

@end

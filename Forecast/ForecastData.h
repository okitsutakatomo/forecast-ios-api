//
//  ForecastData.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#define FORECAST_ICON_CLEARDAY @"clear-day"
#define FORECAST_ICON_CLEARNIGHT @"clear-night"
#define FORECAST_ICON_RAIN @"rain"
#define FORECAST_ICON_SNOW @"snow"
#define FORECAST_ICON_SLEET @"sleet"
#define FORECAST_ICON_WIND @"wind"
#define FORECAST_ICON_FOG @"fog"
#define FORECAST_ICON_CLOUDY @"cloudy"
#define FORECAST_ICON_PARTLYCLOUDYDAY @"partly-cloudy-day"
#define FORECAST_ICON_PARTLYCLOUDYNIGHT @"partly-cloudy-night"
#define FORECAST_ICON_HAIL @"hail"
#define FORECAST_ICON_THUNDERSTORM @"thunderstorm"
#define FORECAST_ICON_TORNADO @"tornado"

#import <Foundation/Foundation.h>

@interface ForecastData : NSObject

//currently
@property (nonatomic) float cloudCover;
@property (nonatomic) float dewPoint;
@property (nonatomic) float humidity;
@property (nonatomic) NSString* icon;
@property (nonatomic) float ozone;
@property (nonatomic) float precipIntensity;
@property (nonatomic) float precipProbability;
@property (nonatomic) NSString* precipType;
@property (nonatomic) float pressure;
@property (nonatomic, strong) NSString* summary;
@property (nonatomic) float temperature;
@property (nonatomic, strong) NSDate* time;
@property (nonatomic) float visibility;
@property (nonatomic) int windBearing;
@property (nonatomic) float windSpeed;

//daily, hourly
@property (nonatomic) float precipIntensityMax;
@property (nonatomic, strong) NSDate* precipIntensityMaxTime;
@property (nonatomic, strong) NSDate* sunriseTime;
@property (nonatomic, strong) NSDate* sunsetTime;
@property (nonatomic) float temperatureMax;
@property (nonatomic, strong) NSDate* temperatureMaxTime;
@property (nonatomic) float temperatureMin;
@property (nonatomic, strong) NSDate* temperatureMinTime;

-(id)initWithData:(NSDictionary*)data;

-(NSString*)displayPrecipIntensityMaxTime;
-(NSString*)displaySunriseTime;
-(NSString*)displaySunsetTime;
-(NSString*)displayTemperatureMaxTime;
-(NSString*)displayTemperatureMinTime;
-(NSString*)displayTimeDate;
-(NSString*)displayTimeFull;
-(NSString*)displayTime;

@end

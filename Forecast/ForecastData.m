//
//  ForecastData.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "ForecastData.h"

@implementation ForecastData

//currently
@synthesize cloudCover;
@synthesize dewPoint;
@synthesize humidity;
@synthesize icon;
@synthesize ozone;
@synthesize precipIntensity;
@synthesize precipProbability;
@synthesize precipType;
@synthesize pressure;
@synthesize summary;
@synthesize temperature;
@synthesize time;
@synthesize visibility;
@synthesize windBearing;
@synthesize windSpeed;

//daily, hourly
@synthesize precipIntensityMax;
@synthesize precipIntensityMaxTime;
@synthesize sunriseTime;
@synthesize sunsetTime;
@synthesize temperatureMax;
@synthesize temperatureMaxTime;
@synthesize temperatureMin;
@synthesize temperatureMinTime;

-(id)initWithData:(NSDictionary*)data
{
    self = [super init];
    if (self != nil) {
        if ([data objectForKey:@"cloudCover"]){
            self.cloudCover = [[data objectForKey:@"cloudCover"] floatValue];
        }
        if ([data objectForKey:@"dewPoint"]) {
            self.dewPoint = [[data objectForKey:@"dewPoint"] floatValue];
        }
        if ([data objectForKey:@"humidity"]) {
           self.humidity = [[data objectForKey:@"humidity"] floatValue];
        }
        if ([data objectForKey:@"icon"]) {
            self.icon = [data objectForKey:@"icon"];
        }
        if ([data objectForKey:@"ozone"]) {
            self.ozone = [[data objectForKey:@"ozone"] floatValue];
        }
        if ([data objectForKey:@"precipIntensity"]) {
            self.precipIntensity = [[data objectForKey:@"precipIntensity"] floatValue];
        }
        if ([data objectForKey:@"precipProbability"]) {
            self.precipProbability = [[data objectForKey:@"precipProbability"] floatValue];
        }
        if ([data objectForKey:@"precipType"]) {
            self.precipType = [data objectForKey:@"precipType"];
        }
        if ([data objectForKey:@"pressure"]) {
            self.pressure = [[data objectForKey:@"pressure"] floatValue];
        }
        if ([data objectForKey:@"summary"]) {
            self.summary = [data objectForKey:@"summary"];
        }
        if ([data objectForKey:@"temperature"]) {
            self.temperature = [[data objectForKey:@"temperature"] floatValue];
        }
        if ([data objectForKey:@"time"]) {
            self.time = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"time"] doubleValue]];
        }
        if ([data objectForKey:@"visibility"]) {
            self.visibility = [[data objectForKey:@"visibility"] floatValue];
        }
        if ([data objectForKey:@"windBearing"]) {
            self.windBearing = [[data objectForKey:@"windBearing"] intValue];
        }
        if ([data objectForKey:@"windSpeed"]) {
            self.windSpeed = [[data objectForKey:@"windSpeed"] floatValue];
        }
        if ([data objectForKey:@"precipIntensityMax"]) {
            self.precipIntensityMax = [[data objectForKey:@"precipIntensityMax"] floatValue];
        }
        if ([data objectForKey:@"precipIntensityMaxTime"]) {
            self.precipIntensityMaxTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"precipIntensityMaxTime"] doubleValue]];
        }
        if ([data objectForKey:@"sunriseTime"]) {
            self.sunriseTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"sunriseTime"] doubleValue]];
        }
        if ([data objectForKey:@"sunsetTime"]) {
            self.sunsetTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"sunsetTime"] doubleValue]];
        }
        if ([data objectForKey:@"temperatureMax"]) {
            self.temperatureMax = [[data objectForKey:@"temperatureMax"] floatValue];
        }
        if ([data objectForKey:@"temperatureMaxTime"]) {
            self.temperatureMaxTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"temperatureMaxTime"] doubleValue]];            
        }
        if ([data objectForKey:@"temperatureMin"]) {
            self.temperatureMin = [[data objectForKey:@"temperatureMin"] floatValue];
        }
        if ([data objectForKey:@"temperatureMinTime"]) {
            self.temperatureMinTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"temperatureMinTime"] doubleValue]];
        }
    }
    return self;
}

-(NSString*)displayPrecipIntensityMaxTime
{
    if(self.precipIntensityMaxTime) {
        return [self formatDateTime:self.precipIntensityMaxTime];
    } else {
        return nil;
    }
}

-(NSString*)displaySunriseTime
{
    if(self.sunriseTime) {
        return [self formatDateTime:self.sunriseTime];
    } else {
        return nil;
    }
}

-(NSString*)displaySunsetTime
{
    if(self.sunsetTime) {
        return [self formatDateTime:self.sunsetTime];
    } else {
        return nil;
    }
}

-(NSString*)displayTemperatureMaxTime
{
    if(self.temperatureMaxTime) {
        return [self formatDateTime:self.temperatureMaxTime];
    } else {
        return nil;
    }    
}

-(NSString*)displayTemperatureMinTime
{
    if(self.temperatureMinTime) {
        return [self formatDateTime:self.temperatureMinTime];
    } else {
        return nil;
    }
}

-(NSString*)displayTimeDate
{
    if(self.time) {
        return [self formatDate:self.time];
    } else {
        return nil;
    }    
}

-(NSString*)displayTimeFull
{
    if(self.time) {
        return [self formatDateFull:self.time];
    } else {
        return nil;
    }
}

-(NSString*)displayTime
{
    if(self.time) {
        return [self formatDateTime:self.time];
    } else {
        return nil;
    }
}

-(NSString*)formatDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE, MMMM dd, yyyy"]; //MONDAY, JUNE 10, 2013
    return [formatter stringFromDate:date];
}

-(NSString*)formatDateFull:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"KK:mm aa, EEEE, MMMM dd, yyyy"]; //04:11 AM, MONDAY, JUNE 10, 2013
    return [formatter stringFromDate:date];
}

-(NSString*)formatDateTime:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"KK:mm aa"]; //04:11 AM
    return [formatter stringFromDate:date];
}

@end

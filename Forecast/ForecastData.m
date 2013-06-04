//
//  ForecastData.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "ForecastData.h"

@implementation ForecastData

@synthesize cloudCover;
@synthesize dewPoint;
@synthesize humidity;
@synthesize icon;
@synthesize ozone;
@synthesize precipIntensity;
@synthesize precipIntensityMax;
@synthesize pressure;
@synthesize summary;
@synthesize sunriseTime;
@synthesize sunsetTime;
@synthesize temperature;
@synthesize temperatureMax;
@synthesize temperatureMaxTime;
@synthesize temperatureMin;
@synthesize temperatureMinTime;
@synthesize time;
@synthesize windBearing;
@synthesize windSpeed;

-(id)initWithData:(NSDictionary*)data
{
    self = [super init];
    if (self != nil) {
        if ([data objectForKey:@"cloudCover"]){
            self.cloudCover = [[data objectForKey:@"cloudCover"] stringValue];
        }
        if ([data objectForKey:@"dewPoint"]) {
            self.dewPoint = [[data objectForKey:@"dewPoint"] stringValue];
        }
        if ([data objectForKey:@"humidity"]) {
           self.humidity = [[data objectForKey:@"humidity"] stringValue];
        }
        if ([data objectForKey:@"icon"]) {
            self.icon = [data objectForKey:@"icon"];
        }
        if ([data objectForKey:@"ozone"]) {
            self.ozone = [[data objectForKey:@"ozone"] stringValue];            
        }
        if ([data objectForKey:@"precipIntensity"]) {
            self.precipIntensity = [[data objectForKey:@"precipIntensity"] stringValue];            
        }
        if ([data objectForKey:@"precipIntensityMax"]) {
            self.precipIntensityMax = [[data objectForKey:@"precipIntensityMax"] stringValue];
        }
        if ([data objectForKey:@"pressure"]) {
            self.pressure = [[data objectForKey:@"pressure"] stringValue];            
        }
        if ([data objectForKey:@"summary"]) {
            self.summary = [data objectForKey:@"summary"];
        }
        if ([data objectForKey:@"sunriseTime"]) {
            self.sunriseTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"sunriseTime"] doubleValue]];
        }
        if ([data objectForKey:@"sunsetTime"]) {
            self.sunsetTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"sunsetTime"] doubleValue]];            
        }
        if ([data objectForKey:@"temperature"]) {
            self.temperature = [[data objectForKey:@"temperature"] stringValue];
        }
        if ([data objectForKey:@"temperatureMax"]) {
            self.temperatureMax = [[data objectForKey:@"temperatureMax"] stringValue];            
        }
        if ([data objectForKey:@"temperatureMaxTime"]) {
            self.temperatureMaxTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"temperatureMaxTime"] doubleValue]];            
        }
        if ([data objectForKey:@"temperatureMin"]) {
            self.temperatureMin = [[data objectForKey:@"temperatureMin"] stringValue];
        }
        if ([data objectForKey:@"temperatureMinTime"]) {
            self.temperatureMinTime = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"temperatureMinTime"] doubleValue]];
        }
        if ([data objectForKey:@"time"]) {
            self.time = [NSDate dateWithTimeIntervalSince1970:[[data objectForKey:@"time"] doubleValue]];
        }
        if ([data objectForKey:@"windBearing"]) {
            self.windBearing = [[data objectForKey:@"windBearing"] stringValue];            
        }
        if ([data objectForKey:@"windSpeed"]) {
            self.windSpeed = [[data objectForKey:@"windSpeed"] stringValue];            
        }
    }
    return self;
}

-(NSString*)sunriseTimeString
{
    if(self.sunriseTime) {
        return [self formatDateTime:self.sunriseTime];
    } else {
        return nil;
    }
}

-(NSString*)sunsetTimeString
{
    if(self.sunsetTime) {
        return [self formatDateTime:self.sunsetTime];
    } else {
        return nil;
    }    
}

-(NSString*)temperatureMaxTimeString
{
    if(self.temperatureMaxTime) {
        return [self formatDateTime:self.temperatureMaxTime];
    } else {
        return nil;
    }    
}

-(NSString*)temperatureMinTimeString
{
    if(self.temperatureMinTime) {
        return [self formatDateTime:self.temperatureMinTime];
    } else {
        return nil;
    }
}

-(NSString*)dateString
{
    if(self.time) {
        return [self formatDate:self.time];
    } else {
        return nil;
    }    
}

-(NSString*)dateFullString
{
    if(self.time) {
        return [self formatDateFull:self.time];
    } else {
        return nil;
    }
}

-(NSString*)timeString
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

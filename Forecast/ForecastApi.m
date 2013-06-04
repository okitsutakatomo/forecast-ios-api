//
//  ForecastApi.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "Forecast.h"
#import "ForecastApi.h"
#import "AFJSONRequestOperation.h"
#import "ForecastData.h"

@implementation ForecastApi

- (id)init {
    self = [super init];
    if (self != nil) {
    }
    return self;
}

-(void)getCurrentDataForCurrentLocation:(void (^)(ForecastData *data))success
                                failure:(void (^)(NSError *error))failure
{
    CLLocation *location = [[Forecast sharedInstance] currentLocation];
    if(!location) @throw @"can not find current location.";
    [self getDataForLatitude:location.coordinate.latitude
                          longitude:location.coordinate.longitude
                               type:FCOrderTypeCurrentry
                             params:nil
                            success:success
                            failure:failure];
}

-(void)getDailyDataForCurrentLocation:(void (^)(NSMutableArray *responseArray))success
                              failure:(void (^)(NSError *error))failure
{
    CLLocation *location = [[Forecast sharedInstance] currentLocation];
    if(!location) @throw @"can not find current location.";
    [self getDataForLatitude:location.coordinate.latitude
                          longitude:location.coordinate.longitude
                               type:FCOrderTypeDaily
                             params:nil
                            success:success
                            failure:failure];
}

-(void)getHourlyDataForCurrentLocation:(void (^)(NSMutableArray *responseArray))success
                               failure:(void (^)(NSError *error))failure
{
    CLLocation *location = [[Forecast sharedInstance] currentLocation];
    if(!location) @throw @"can not find current location.";
    [self getDataForLatitude:location.coordinate.latitude
                          longitude:location.coordinate.longitude
                               type:FCOrderTypeHourly
                             params:nil
                            success:success
                            failure:failure];   
}

-(void)getCurrentDataForLatitude:(double)lat
                             longitude:(double)lon
                               success:(void (^)(ForecastData *data))success
                               failure:(void (^)(NSError *error))failure {
    
    [self getDataForLatitude:lat
                          longitude:lon
                               type:FCOrderTypeCurrentry
                             params:nil
                            success:success
                            failure:failure];    
}

-(void)getDailyDataForLatitude:(double)lat
                        longitude:(double)lon
                          success:(void (^)(NSMutableArray *responseArray))success
                          failure:(void (^)(NSError *error))failure {
    
    [self getDataForLatitude:lat
                          longitude:lon
                               type:FCOrderTypeDaily
                             params:nil
                            success:success
                            failure:failure];
}

-(void)getHourlyDataForLatitude:(double)lat
                         longitude:(double)lon
                           success:(void (^)(NSMutableArray *responseArray))success
                           failure:(void (^)(NSError *error))failure {
    
    [self getDataForLatitude:lat
                          longitude:lon
                               type:FCOrderTypeHourly
                             params:nil
                            success:success
                            failure:failure];
}


-(void)getCurrentDataForAddress:(NSString*)address
                        success:(void (^)(ForecastData *data))success
                        failure:(void (^)(NSError *error))failure {
    
    [self getDataForAddress:address
                       type:FCOrderTypeCurrentry
                     params:nil
                    success:success
                    failure:failure];
}

-(void)getDailyDataForAddress:(NSString*)address
                        success:(void (^)(NSMutableArray *responseArray))success
                        failure:(void (^)(NSError *error))failure {
    
    [self getDataForAddress:address
                       type:FCOrderTypeDaily
                     params:nil
                    success:success
                    failure:failure];
}

-(void)getHourlyDataForAddress:(NSString*)address
                        success:(void (^)(NSMutableArray *responseArray))success
                        failure:(void (^)(NSError *error))failure {
    
    [self getDataForAddress:address
                       type:FCOrderTypeHourly
                     params:nil
                    success:success
                    failure:failure];
}


-(void)getDataForLatitude:(double)lat
                       longitude:(double)lon
                            type:(FCOrderType)type
                          params:(NSDictionary*)params
                         success:(void (^)(id response))success
                         failure:(void (^)(NSError *error))failure {
    
    NSString* apiKey = [[Forecast sharedInstance] apiKey];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/%.6f,%.6f?units=ca", FORECAST_BASE_URL, apiKey, lat, lon]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        if (type == FCOrderTypeDaily) {
            NSMutableArray *dataArray = [NSMutableArray array];
            for(NSDictionary *dataDict in [[JSON objectForKey:@"daily"] objectForKey:@"data"]) {
                [dataArray addObject:[[ForecastData alloc] initWithData:dataDict]];
            }
            success(dataArray);
        } else if (type == FCOrderTypeHourly) {
            NSMutableArray *dataArray = [NSMutableArray array];
            for(NSDictionary *dataDict in [[JSON objectForKey:@"hourly"] objectForKey:@"data"]) {
                [dataArray addObject:[[ForecastData alloc] initWithData:dataDict]];
            }
            success(dataArray);
        } else if (type == FCOrderTypeCurrentry) {
            NSDictionary *dataDict = [JSON objectForKey:@"currently"];
            success([[ForecastData alloc] initWithData:dataDict]);
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}


-(void)getDataForAddress:(NSString*)address
                       type:(FCOrderType)type
                     params:(NSDictionary*)params
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError *error))failure {
    
    [self getLocationForAddress:address success:^(CLLocation *location) {
        if (type == FCOrderTypeDaily) {
            [self getDailyDataForLatitude:location.coordinate.latitude
                                longitude:location.coordinate.longitude
                                  success:^(NSMutableArray *responseArray) {
                                      success(responseArray);
                                  } failure:^(NSError *error) {
                                      failure(error);
                                  }];
        } else if (type == FCOrderTypeHourly) {
            [self getHourlyDataForLatitude:location.coordinate.latitude
                                 longitude:location.coordinate.longitude
                                   success:^(NSMutableArray *responseArray) {
                                       success(responseArray);
                                   } failure:^(NSError *error) {
                                       failure(error);
                                   }];
        } else if (type == FCOrderTypeCurrentry) {
            [self getCurrentDataForLatitude:location.coordinate.latitude
                                  longitude:location.coordinate.longitude
                                    success:^(ForecastData *data) {
                                        success(data);
                                    } failure:^(NSError *error) {
                                        failure(error);
                                    }];
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)getLocationForAddress:(NSString*)address
                     success:(void (^)(CLLocation *location))success
                     failure:(void (^)(NSError *error))failure {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error) {
                     NSLog(@"found : %d", [placemarks count]);
                     if ([placemarks count] > 0) {
                         CLPlacemark* placemark = [placemarks objectAtIndex:0];
                         success(placemark.location);
                     } else {
                         NSMutableDictionary* errDetails = [NSMutableDictionary dictionary];
                         [errDetails setValue:[NSString stringWithFormat:@"address not found: %@", address] forKey:NSLocalizedDescriptionKey];
                         NSError *error = [NSError errorWithDomain:@"world" code:200 userInfo:errDetails];
                         failure(error);
                     }
                 }];
}

@end

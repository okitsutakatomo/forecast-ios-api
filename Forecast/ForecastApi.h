//
//  ForecastApi.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013 Takatomo Okitsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Forecast.h"
#import "ForecastData.h"

@interface ForecastApi : NSObject


+ (ForecastApi*)sharedInstance;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getCurrentDataForCurrentLocation:(void (^)(ForecastData *data))success
                                failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getDailyDataForCurrentLocation:(void (^)(NSMutableArray *responseArray))success
                              failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getHourlyDataForCurrentLocation:(void (^)(NSMutableArray *responseArray))success
                               failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getCurrentDataForLatitude:(double)lat
                       longitude:(double)lon
                         success:(void (^)(ForecastData *data))success
                         failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getDailyDataForLatitude:(double)lat
                     longitude:(double)lon
                       success:(void (^)(NSMutableArray *responseArray))success
                       failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getHourlyDataForLatitude:(double)lat
                      longitude:(double)lon
                        success:(void (^)(NSMutableArray *responseArray))success
                        failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getCurrentDataForAddress:(NSString*)address
                        success:(void (^)(ForecastData *data))success
                        failure:(void (^)(NSError *error))failure;
    
/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getDailyDataForAddress:(NSString*)address
                      success:(void (^)(NSMutableArray *responseArray))success
                      failure:(void (^)(NSError *error))failure;


/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getHourlyDataForAddress:(NSString*)address
                       success:(void (^)(NSMutableArray *responseArray))success
                       failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getDataForLatitude:(double)lat
                longitude:(double)lon
                     type:(FCOrderType)type
                   params:(NSDictionary*)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError *error))failure;

/**
 * Request the current conditions for the give location for the next week.
 *
 * @param lat The latitude of the location.
 * @param long The longitude of the location.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
-(void)getDataForAddress:(NSString*)address
                    type:(FCOrderType)type
                  params:(NSDictionary*)params
                 success:(void (^)(id response))success
                 failure:(void (^)(NSError *error))failure;

-(void)getLocationForAddress:(NSString*)address
                     success:(void (^)(CLLocation *location))success
                     failure:(void (^)(NSError *error))failure;

@end

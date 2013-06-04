//
//  Forecast.m
//  
//
//  Created by Takatomo Okitsu on 2013/06/04.
//
//

#import "Forecast.h"
#import "AFJSONRequestOperation.h"

@interface Forecast()

@property (nonatomic, strong) NSString *apiKey;

@end

@implementation Forecast

static NSString *_apiKey;

+(void)setAPIKey:(NSString*)apiKey
{
    _apiKey = apiKey;
}

-(id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

-(void)getCurrentConditionsForLatitude:(double)lat
                             longitude:(double)lon
                               success:(void (^)(NSMutableDictionary *responseDict))success
                               failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%.6f,%.6f", _apiKey, lat, lon]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success([NSMutableDictionary dictionaryWithDictionary:[JSON objectForKey:@"currently"]]);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}

-(void)getDailyForcastForLatitude:(double)lat
                        longitude:(double)lon
                          success:(void (^)(NSMutableArray *responseArray))success
                          failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%.6f,%.6f", _apiKey, lat, lon]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success([NSMutableArray arrayWithArray:[[JSON objectForKey:@"daily"] objectForKey:@"data"]]);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}

-(void)getHourlyForcastForLatitude:(double)lat
                         longitude:(double)lon
                           success:(void (^)(NSMutableArray *responseArray))success
                           failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%.6f,%.6f", _apiKey, lat, lon]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success([NSMutableArray arrayWithArray:[[JSON objectForKey:@"hourly"] objectForKey:@"data"]]);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}

-(void)getDailyForcastForLatitude:(double)lat
                        longitude:(double)lon
                             time:(NSTimeInterval)time
                          success:(void (^)(NSMutableArray *responseArray))success
                          failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%.6f,%.6f,%.0f", _apiKey, lat, lon, time]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success([NSMutableArray arrayWithArray:[[JSON objectForKey:@"daily"] objectForKey:@"data"]]);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}

-(void)getHourlyForcastForLatitude:(double)lat
                         longitude:(double)lon
                              time:(NSTimeInterval)time
                           success:(void (^)(NSMutableArray *responseArray))success
                           failure:(void (^)(NSError *error))failure {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%.6f,%.6f,%.0f", _apiKey, lat, lon, time]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        success([NSMutableArray arrayWithArray:[[JSON objectForKey:@"hourly"] objectForKey:@"data"]]);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        
        failure(error);
        
    }];
    [operation start];
}

@end
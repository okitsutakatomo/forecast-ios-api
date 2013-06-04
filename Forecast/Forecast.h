//
//  Forecast.h
//  
//
//  Created by Takatomo Okitsu on 2013/06/04.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef enum {
    FCOrderTypeCurrentry,
    FCOrderTypeDaily,
    FCOrderTypeHourly,
} FCOrderType;

#define FORECAST_BASE_URL @"https://api.forecast.io/forecast"

#define FORECAST_US_UNITS @"us"
#define FORECAST_CS_UNITS @"si"
#define FORECAST_UK_UNITS @"uk"
#define FORECAST_CA_UNITS @"ca"

@interface Forecast : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) NSString* apiKey;
@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;

+ (Forecast*)sharedInstance;
-(void)initializeWithApiKey:(NSString*)apiKey;

@end
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

#define FORECAST_LOCAL_NOTIFICATION_UPDATE_CURRENT_LOCATION @"forecast.local.notification.update.current.location"
#define FORECAST_LOCAL_NOTIFICATION_DENIED_CURRENT_LOCATION @"forecast.local.notification.denied.current.location"

@interface Forecast : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) NSString* apiKey;
@property (nonatomic, strong) CLLocationManager* locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;
@property (nonatomic, strong) NSString* currentLocationString;
@property (nonatomic, strong) CLPlacemark* currentLocationPlacemark;

+ (Forecast*)sharedInstance;
-(void)initializeWithApiKey:(NSString*)apiKey;

@end
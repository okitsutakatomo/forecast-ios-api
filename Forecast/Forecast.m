//
//  Forecast.m
//  
//
//  Created by Takatomo Okitsu on 2013/06/04.
//
//

#import "Forecast.h"


@interface Forecast()

@end

@implementation Forecast

@synthesize apiKey;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize currentLocationString;
@synthesize currentLocationPlacemark;

+ (Forecast*)sharedInstance {
    static Forecast* _instance = nil;
    
	if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[Forecast alloc] init];
        });
	}
    
	return _instance;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        [self.locationManager startMonitoringSignificantLocationChanges]; //row battery
    }
    
    return self;
}

- (void)initializeWithApiKey:(NSString*)key
{
    self.apiKey = key;
}

// -- delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.currentLocation = newLocation;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:FORECAST_LOCAL_NOTIFICATION_UPDATE_CURRENT_LOCATION
                                                        object:self
                                                      userInfo:nil];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:currentLocation.coordinate.latitude
                                                      longitude:currentLocation.coordinate.longitude];
    
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray* placemarks, NSError* error) {
                       if([placemarks count] > 0) {
                           CLPlacemark* placemark = placemarks[0];
                           self.currentLocationPlacemark = placemark;
                           self.currentLocationString = [NSString stringWithFormat:@"%@, %@", placemark.locality, placemark.administrativeArea];
                       }
                   }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (error) {
		switch ([error code]) {
			case kCLErrorDenied:
				[self.locationManager stopUpdatingLocation];
                [[NSNotificationCenter defaultCenter] postNotificationName:FORECAST_LOCAL_NOTIFICATION_DENIED_CURRENT_LOCATION
                                                                    object:self
                                                                  userInfo:nil];
				break;
			default:
                NSLog(@"failed to get location. %@", error.localizedDescription);
				break;
		}
	}
}

@end
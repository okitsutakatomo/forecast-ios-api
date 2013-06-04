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
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:currentLocation.coordinate.latitude
                                                      longitude:currentLocation.coordinate.longitude];
    
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray* placemarks, NSError* error) {
                       NSLog(@"found : %d", [placemarks count]);
                       
                       if([placemarks count] > 0) {
                           CLPlacemark* placemark = placemarks[0];
                           self.currentLocationString = [NSString stringWithFormat:@"%@, %@", placemark.administrativeArea, placemark.country];
                       }
                   }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if (error) {
        NSLog(@"failed to get location. %@", error.localizedDescription);
	}
}

@end
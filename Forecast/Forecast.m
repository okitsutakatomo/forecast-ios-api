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
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	if (error) {
        NSLog(@"failed to get location. %@", error.localizedDescription);
	}
}

@end
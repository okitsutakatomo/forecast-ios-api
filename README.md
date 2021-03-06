forecast-ios-api
================

A simple Objective-C wrapper for the [Forecast.io API version 2](https://developer.forecast.io/docs/v2).

Additional support features:
* **Current Location**: fetch data using device current location.
* **Address**: fetch data using address string.

## Usage ##

The code base comes with two examples:
* **Example**: A simple example showing how to use all of the different options available through the API request

And here is a very basic example:

```objc
#import "AppDelegate.h"
#import "Forecast.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[[Forecast sharedInstance] initializeWithApiKey:@"FORECAST_APIKEY"];

	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[TopViewController alloc] init]];
	[self.window makeKeyAndVisible];
	return YES;
}
```

fetch currently forecast data using Current location:

```objc
#import "TopViewController.h"
#import "Forecast.h"
#import "ForecastApi.h"
#import "ForecastData.h"

@interface TopViewController ()
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	ForecastApi* api = [ForecastApi sharedInstance];
	[api getCurrentDataForCurrentLocation:^(ForecastData *data) {
		NSLog(@"%@", data.temperature);
		NSLog(@"%@", data.icon);
	} failure:^(NSError *error) {
		NSLog(@"%@", error);
	}];
}

@end
```

fetch currently forecast data using Address:

```objc
#import "TopViewController.h"
#import "Forecast.h"
#import "ForecastApi.h"
#import "ForecastData.h"

@interface TopViewController ()
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	ForecastApi* api = [ForecastApi sharedInstance];
	[api getCurrentDataForAddress:@"yokohama, kanagawa" success:^(ForecastData *data) {
		NSLog(@"%@", data.temperature);
		NSLog(@"%@", data.icon);
	} failure:^(NSError *error) {
		NSLog(@"%@", error);
	}];
}

@end
```

fetch daily forecast data using current location:

```objc
#import "TopViewController.h"
#import "Forecast.h"
#import "ForecastApi.h"
#import "ForecastData.h"

@interface TopViewController ()
{
	UITableView* _tableView;	
	NSMutableArray* _dataSource;	
}
@end

@implementation TopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	ForecastApi* api = [ForecastApi sharedInstance];
	[api getDailyDataForCurrentLocation:^(NSMutableArray *responseArray) {
		_dataSource = [responseArray mutableCopy];
		[_tableView reloadData];
	} failure:^(NSError *error) {
		NSLog(@"%@", error);
	}];
}

@end
```

## License ##

Essentially, this code is free to use in commercial and non-commercial projects with no attribution necessary.

See the `LICENSE` file for more details.

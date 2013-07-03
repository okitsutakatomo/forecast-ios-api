//
//  DetailViewController.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "DetailViewController.h"
#import "ForecastData.h"
#import "ForecastApi.h"

@interface DetailViewController ()
{
    ForecastData* _data;
    NSArray* _dataSource;
    NSString* _address;
    UIActivityIndicatorView* _indicator;
}
@end

@implementation DetailViewController

- (id)initWithAddress:(NSString*)address
{
    self = [super init];
    if(self) {
        _address = address;
    }
    return self;
}

- (id)initWithForecastData:(ForecastData*)data
{
    self = [super init];
    if(self) {
        _data = data;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_indicator setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
    [self.view addSubview:_indicator];
    
    _dataSource = @[@"cloudCover",
                    @"dewPoint",
                    @"humidity",
                    @"icon",
                    @"ozone",
                    @"precipIntensity",
                    @"precipProbability",
                    @"precipType",
                    @"pressure",
                    @"summary",
                    @"temperature",
                    @"visibility",
                    @"windBearing",
                    @"windSpeed",
                    @"precipIntensityMax",
                    @"displayTimeDate",
                    @"displayTimeFull",
                    @"displayTime",
                    @"displayPrecipIntensityMaxTime",
                    @"displaySunriseTime",
                    @"displaySunsetTime",
                    @"temperatureMax",
                    @"displayTemperatureMaxTime",
                    @"temperatureMin",
                    @"displayTemperatureMinTime",
                    ];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadData];    
}

- (void)loadData
{
    if(_data) {
        return;
    }
    
    [_indicator startAnimating];
    ForecastApi* api = [ForecastApi sharedInstance];
    
    if(_address) {
        self.title = _address;
        [api getCurrentDataForAddress:_address success:^(ForecastData *data) {
            _data = data;
            [self.tableView reloadData];
            [_indicator stopAnimating];
        } failure:^(NSError *error) {
            NSLog(@"%@", error);
            [_indicator stopAnimating];
        }];
    } else {
        self.title = @"Current location";
        [api getCurrentDataForCurrentLocation:^(ForecastData *data) {
            _data = data;
            [self.tableView reloadData];
            [_indicator stopAnimating];
        } failure:^(NSError *error) {
            NSLog(@"%@", error);
            [_indicator stopAnimating];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    if(!_data) return cell;
    
    NSString* content = [_dataSource objectAtIndex:indexPath.row];
    NSString* value;
    
    if ([content isEqualToString:@"cloudCover"]) {
        value = [NSString stringWithFormat:@"%g", _data.cloudCover];
    } else if ([content isEqualToString:@"dewPoint"]) {
        value = [NSString stringWithFormat:@"%g", _data.dewPoint];
    } else if ([content isEqualToString:@"humidity"]) {
        value = [NSString stringWithFormat:@"%g", _data.humidity];
    } else if ([content isEqualToString:@"icon"]) {
        value = _data.icon;
    } else if ([content isEqualToString:@"ozone"]) {
        value = [NSString stringWithFormat:@"%g", _data.ozone];
    } else if ([content isEqualToString:@"precipIntensity"]) {
        value = [NSString stringWithFormat:@"%g", _data.precipIntensity];
    } else if ([content isEqualToString:@"precipProbability"]) {
        value = [NSString stringWithFormat:@"%g", _data.precipProbability];
    } else if ([content isEqualToString:@"precipType"]) {
        value = _data.precipType;
    } else if ([content isEqualToString:@"pressure"]) {
        value = [NSString stringWithFormat:@"%g", _data.pressure];
    } else if ([content isEqualToString:@"summary"]) {
        value = _data.summary;
    } else if ([content isEqualToString:@"temperature"]) {
        value = [NSString stringWithFormat:@"%g", _data.temperature];
    } else if ([content isEqualToString:@"visibility"]) {
        value = [NSString stringWithFormat:@"%g", _data.visibility];
    } else if ([content isEqualToString:@"windBearing"]) {
        value = [NSString stringWithFormat:@"%d", _data.windBearing];
    } else if ([content isEqualToString:@"windSpeed"]) {
        value = [NSString stringWithFormat:@"%g", _data.windSpeed];
    } else if ([content isEqualToString:@"precipIntensityMax"]) {
        value = [NSString stringWithFormat:@"%g", _data.precipIntensityMax];
    } else if ([content isEqualToString:@"displayTimeDate"]) {
        value = _data.displayTimeDate;
    } else if ([content isEqualToString:@"displayTimeFull"]) {
        value = _data.displayTimeFull;
    } else if ([content isEqualToString:@"displayTime"]) {
        value = _data.displayTime;
    } else if ([content isEqualToString:@"displayPrecipIntensityMaxTime"]) {
        value = _data.displayPrecipIntensityMaxTime;
    } else if ([content isEqualToString:@"displaySunriseTime"]) {
        value = _data.displaySunriseTime;
    } else if ([content isEqualToString:@"displaySunsetTime"]) {
        value = _data.displaySunsetTime;
    } else if ([content isEqualToString:@"temperatureMax"]) {
        value = [NSString stringWithFormat:@"%g", _data.temperatureMax];
    } else if ([content isEqualToString:@"displayTemperatureMaxTime"]) {
        value = _data.displayTemperatureMaxTime;
    } else if ([content isEqualToString:@"temperatureMin"]) {
        value = [NSString stringWithFormat:@"%g", _data.temperatureMin];
    } else if ([content isEqualToString:@"displayTemperatureMinTime"]) {
        value = _data.displayTemperatureMinTime;
    }
    
    cell.textLabel.text = content;
    cell.detailTextLabel.text = value;
    return cell;
}


@end

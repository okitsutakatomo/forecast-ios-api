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
    UIActivityIndicatorView* _indicator;
}
@end

@implementation DetailViewController

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
                    @"precipIntensityMax",
                    @"pressure",
                    @"summary",
                    @"sunriseTimeString",
                    @"sunsetTimeString",
                    @"temperatureMax",
                    @"temperatureMaxTimeString",
                    @"temperatureMin",
                    @"temperatureMinTimeString",
                    @"dateString",
                    @"dateFullString",
                    @"timeString",
                    @"windBearing",
                    @"windSpeed",
                    ];
    
    if(!_data) {
        [self loadCurrentlyData];
    }
}

- (void)loadCurrentlyData
{
    [_indicator startAnimating];
    
    ForecastApi* api = [[ForecastApi alloc] init];
    [api getCurrentDataForCurrentLocation:^(ForecastData *data) {
        _data = data;
        [self.tableView reloadData];
        [_indicator stopAnimating];
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        [_indicator stopAnimating];
    }];

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
    
    NSString* methodName = [_dataSource objectAtIndex:indexPath.row];
    SEL selector = NSSelectorFromString(methodName);
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    NSString *value = [_data performSelector:selector];
#pragma clang diagnostic pop
    
    cell.textLabel.text = methodName;
    cell.detailTextLabel.text = value;
    return cell;
}


@end

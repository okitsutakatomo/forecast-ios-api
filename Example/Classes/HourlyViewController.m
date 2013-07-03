//
//  HourlyViewController.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "ForecastApi.h"
#import "HourlyViewController.h"
#import "DetailViewController.h"
#import "ForecastData.h"

@interface HourlyViewController ()
{
    NSMutableArray* _dataSource;
    UIActivityIndicatorView* _indicator;
    NSString* _address;
}

@end

@implementation HourlyViewController

@synthesize tableView;

- (id)initWithAddress:(NSString*)address {
    self = [super init];
    if (self) {
        _address = address;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    [self.view addSubview:self.tableView];
    
    _dataSource = [NSMutableArray array];
    
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_indicator setCenter:CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2)];
    [self.view addSubview:_indicator];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // load forecast data and rendering view.
    [self loadData];
}


- (void)loadData
{
    [_indicator startAnimating];
    
    ForecastApi* api = [ForecastApi sharedInstance];
    if(_address) {
        self.title = _address;
        [api getHourlyDataForAddress:_address
                            success:^(NSMutableArray *responseArray) {
                                _dataSource = [responseArray mutableCopy];
                                [self.tableView reloadData];
                                [_indicator stopAnimating];
                            } failure:^(NSError *error) {
                                NSLog(@"%@", error);
                                [_indicator stopAnimating];
                            }];
    } else {
        self.title = @"Current location";
        [api getHourlyDataForCurrentLocation:^(NSMutableArray *responseArray) {
            _dataSource = [responseArray mutableCopy];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    ForecastData *data = [_dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = data.displayTimeFull;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForecastData *data = [_dataSource objectAtIndex:indexPath.row];
    
    DetailViewController *controller = [[DetailViewController alloc] initWithForecastData:data];
    [self.navigationController pushViewController:controller animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end

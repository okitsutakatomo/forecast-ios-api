//
//  TopViewController.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/05.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//


#import "TopViewController.h"
#import "SelectBlockViewController.h"
#import "DailyViewController.h"
#import "HourlyViewController.h"
#import "ForecastApi.h"

@interface TopViewController ()
{
    NSMutableArray *_dataSource;
    NSString *_address;
}

@end

@implementation TopViewController

@synthesize tableView;

NSString * const kCURRENT_LOCATION_LABEL = @"Current location";
NSString * const kYOKOHAMA_LABEL = @"Yokohama, Kanagawa";
NSString * const kSHIBUYA_LABEL = @"Shibuya, Tokyo";
NSString * const kSAPPORO_LABEL = @"Sapporo, Hokkaido";
NSString * const kHAKATA_LABEL = @"Fukuoka";
NSString * const kRIO_LABEL = @"Rio de janeiro, Brazil";

- (id)initWithAddress:(NSString*)address
{
    self = [super init];
    if(self) {
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
    _dataSource = [@[kCURRENT_LOCATION_LABEL, kYOKOHAMA_LABEL, kSHIBUYA_LABEL, kSAPPORO_LABEL, kHAKATA_LABEL, kRIO_LABEL] mutableCopy];;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    // dummy request
    ForecastApi* api = [ForecastApi sharedInstance];
    [api getCurrentDataForCurrentLocation:^(ForecastData *data) {
        NSLog(@"%@", data.temperature);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *label = selectedCell.textLabel.text;
    if ([label isEqualToString:kCURRENT_LOCATION_LABEL]) {
        SelectBlockViewController *controller = [[SelectBlockViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        SelectBlockViewController *controller = [[SelectBlockViewController alloc] initWithAddress:label];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
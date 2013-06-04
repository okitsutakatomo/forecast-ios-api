//
//  SelectBlockViewController.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "SelectBlockViewController.h"
#import "DetailViewController.h"
#import "DailyViewController.h"
#import "HourlyViewController.h"
#import "ForecastApi.h"

@interface SelectBlockViewController ()
{
    NSMutableArray *_dataSource;
    NSString *_address;
}

@end

@implementation SelectBlockViewController

@synthesize tableView;

NSString * const kCURRENTDATALABEL = @"Currently (Now)";
NSString * const kDAILYDATALABEL = @"Daily";
NSString * const kHOURLYDATALABEL = @"Hourly";

- (id)initWithAddress:(NSString*)address
{
    self = [super init];
    if(self) {
        _address = address;
        self.title = _address;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    [self.view addSubview:self.tableView];
    
    _dataSource = [NSMutableArray array];
    _dataSource = [@[kCURRENTDATALABEL, kDAILYDATALABEL, kHOURLYDATALABEL] mutableCopy];;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if(!_address) {
        self.title = [[Forecast sharedInstance] currentLocationString];
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
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *label = selectedCell.textLabel.text;
    UIViewController *controller;
    if ([label isEqualToString:kCURRENTDATALABEL]) {
        if(_address) {
            controller = [[DetailViewController alloc] initWithAddress:_address];
        } else {
            controller = [[DetailViewController alloc] init];
        }
    } else if ([label isEqualToString:kDAILYDATALABEL]) {
        if(_address) {
            controller = [[DailyViewController alloc] initWithAddress:_address];
        } else {
            controller = [[DailyViewController alloc] init];
        }
    } else if ([label isEqualToString:kHOURLYDATALABEL]) {
        if(_address) {
            controller = [[HourlyViewController alloc] initWithAddress:_address];
        } else {
            controller = [[HourlyViewController alloc] init];
        }
    }
    
    [self.navigationController pushViewController:controller animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end

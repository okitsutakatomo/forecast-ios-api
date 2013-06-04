//
//  EntranceViewController.m
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import "EntranceViewController.h"
#import "DetailViewController.h"
#import "DailyViewController.h"
#import "HourlyViewController.h"

@interface EntranceViewController ()
{
    NSMutableArray *dataSource;
}

@end

@implementation EntranceViewController

@synthesize tableView;

NSString * const kCURRENTDATALABEL = @"Current";
NSString * const kDAILYDATALABEL = @"Daily";
NSString * const kHOURLYDATALABEL = @"Hourly";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    [self.view addSubview:self.tableView];
    
    dataSource = [NSMutableArray array];
    dataSource = [@[kCURRENTDATALABEL, kDAILYDATALABEL, kHOURLYDATALABEL] mutableCopy];;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = [dataSource objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* selectedCell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *label = selectedCell.textLabel.text;
    if ([label isEqualToString:kCURRENTDATALABEL]) {
        DetailViewController *controller = [[DetailViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if ([label isEqualToString:kDAILYDATALABEL]) {
        DailyViewController *controller = [[DailyViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if ([label isEqualToString:kHOURLYDATALABEL]) {
        HourlyViewController *controller = [[HourlyViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end

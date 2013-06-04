//
//  TopViewController.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/05.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

//
//  EntranceViewController.h
//  forecast-ios-api-example
//
//  Created by Takatomo Okitsu on 2013/06/04.
//  Copyright (c) 2013年 Takatomo Okitsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntranceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

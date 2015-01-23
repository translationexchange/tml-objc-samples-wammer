//
//  ApplicationTableViewController.h
//  Wammer
//
//  Created by Michael Berkovich on 2/25/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationViewController.h"

@interface ApplicationTableViewController : ApplicationViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *itemsTableView;

@property (nonatomic, retain) NSArray *items;

@end

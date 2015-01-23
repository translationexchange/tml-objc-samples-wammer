//
//  MenuViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/22/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "MenuViewController.h"
#import "Tml.h"
#import "IIViewDeckController.h"
#import "NewsfeedViewController.h"
#import "UIViewController+Tml.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = @[
                   @{
                       @"title": @"",
                       @"items": @[
                               @{
                                   @"title": @"My Feed",
                                   @"controller": @"NavigationViewController"
                                   },
                               @{
                                   @"title": @"Newsfeed",
                                   @"controller": @"NewsfeedViewController"
                                   },
                               @{
                                   @"title": @"People",
                                   },
                               @{
                                   @"title": @"Add Coworkers",
                                   }
                               ]
                       },
                   @{
                       @"title": @"My Groups",
                       @"items": @[
                               @{
                                   @"title": @"All Company",
                                   },
                               @{
                                   @"title": @"Engineering",
                                   },
                               @{
                                   @"title": @"More Groups",
                                   },
                               ]
                       },
                   @{
                       @"title": @"Account",
                       @"items": @[
                               @{
                                   @"title": @"My Profile",
                                   },
                               @{
                                   @"title": @"My Networks",
                                   },
                               @{
                                   @"title": @"Settings",
                                   @"controller": @"SettingsViewController"
                                   },
                               @{
                                   @"title": @"Log Out",
                                   },
                               ]
                       }
                   ];
}

- (void) translate {
    [super translate];
    TmlLocalizeViewWithLabel(self.titleLabel, @"Main Menu");
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TmlBeginBlockWithOptions(@{@"source": @"Menu options"})
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    
    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    TmlLocalizeViewWithLabel(cell.textLabel, [[[section objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"title"]);
    
    TmlEndBlockWithOptions
    return cell;
}

@end

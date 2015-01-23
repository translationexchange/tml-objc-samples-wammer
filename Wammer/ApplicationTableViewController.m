//
//  ApplicationTableViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/25/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "ApplicationTableViewController.h"
#import "IIViewDeckController.h"
#import "UIViewController+Tml.h"

@interface ApplicationTableViewController ()

@end

@implementation ApplicationTableViewController

@synthesize itemsTableView, items;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.items count];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeader = [[UIView alloc] init];
    sectionHeader.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, tableView.frame.size.width, 40)];
    NSDictionary *sec = (NSDictionary *) [self.items objectAtIndex:section];
    TmlLocalizeViewWithLabel(label, [sec objectForKey:@"title"]);
    [sectionHeader addSubview:label];
    return sectionHeader;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    return [item objectForKey:@"title"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    if ([[item objectForKey:@"title"] isEqualToString:@""])
        return 0;
    
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *item = (NSDictionary *) [self.items objectAtIndex:section];
    return [[item objectForKey:@"items"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    
    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    cell.textLabel.text = [[[section objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    NSString *selectedController = [[[section objectForKey:@"items"] objectAtIndex:indexPath.row] objectForKey:@"controller"];
    
    if (!selectedController)
    return;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    if (selectedController) {
        [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
            controller.centerController = [mainStoryboard instantiateViewControllerWithIdentifier: selectedController];
        }];
    }
}

- (void) translate {
}

- (void) translationsLoaded {
    [self translate];
    [self.itemsTableView reloadData];
}

@end

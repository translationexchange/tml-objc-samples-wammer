//
//  MyFeedViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/22/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "MyFeedViewController.h"
#import "Tml.h"
#import "FeedTableViewCell.h"
#import "UIViewController+Tml.h"

@interface MyFeedViewController ()

@property (nonatomic, retain) NSString *button1Label, *button2Label;

@end

@implementation MyFeedViewController

@synthesize button1Label, button2Label;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = @[
                   @{
                       @"title": @"",
                       @"items": @[
                               @{
                                   @"image": [UIImage imageNamed:@"Michael.jpeg"],
                                   @"title": @"Michael",
                                   @"subtitle": @[@"To [bold: {group}] and [bold: {user}]", @{@"group": @"All Company", @"user": @"George"}],
                                   @"message": @"[bold: George] please send me the slides from the presentation you did on Thursday.",
                                   @"time": @5
                                   },
                               @{
                                   @"image": [UIImage imageNamed:@"George.png"],
                                   @"title": @"George",
                                   @"subtitle": @[@"To {group} and {user}", @{@"group": @"All Company", @"user": @"Ian"}],
                                   @"message": @"[bold: Ian] please give me a call when you are done with your meeting.",
                                   @"time": @10
                                   },
                               @{
                                   @"image": [UIImage imageNamed:@"Ian.jpeg"],
                                   @"title": @"Ian",
                                   @"subtitle": @[@"To {group}", @{@"group": @"All Company"}],
                                   @"message": @"I am going to a meeting with a customer. Will be done in 30 minutes.",
                                   @"time": @15
                                   },
                               ]
                       },
                   ];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TmlBeginBlockWithOptions(@{@"source": @"Feed stories"})
    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedTableViewCell"];
    
    if (cell == nil) {
        cell = [[FeedTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"FeedTableViewCell"];
    }
    
    TmlLocalizeViewWithLabelAndDescription(cell.button1Label, @"Reply", @"Reply to message");
    TmlLocalizeViewWithLabelAndDescription(cell.button2Label, @"Like", @"Like this message");

    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    NSDictionary *item = (NSDictionary *) [[section objectForKey:@"items"] objectAtIndex:indexPath.row];
    
    cell.imageView.image = [item objectForKey:@"image"];

    TmlDebug(@"%@", [item objectForKey:@"message"]);
    
    cell.textView.attributedText = TmlLocalizedAttributedString([item objectForKey:@"message"]);
    TmlLocalizeViewWithLabel(cell.textView, [item objectForKey:@"message"]);
    
    TmlLocalizeViewWithLabelAndTokens(cell.subtitleLabel, [[item objectForKey:@"subtitle"] objectAtIndex:0], [[item objectForKey:@"subtitle"] objectAtIndex:1]);
    TmlLocalizeViewWithLabel(cell.titleLabel, [item objectForKey:@"title"]);
    TmlLocalizeViewWithLabelAndTokens(cell.timeLabel, @"{count}m", (@{@"count": [item objectForKey:@"time"]}));
    
    TmlEndBlockWithOptions
                                
    return cell;
}

@end

//
//  NewsfeedViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/23/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "NewsfeedViewController.h"
#import "Tml.h"
#import "FeedTableViewCell.h"
#import "UIViewController+Tml.h"

@interface NewsfeedViewController ()

@property (nonatomic, retain) NSString *button1Label, *button2Label;

@end

@implementation NewsfeedViewController

@synthesize button1Label, button2Label;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.items = @[
    @{
       @"title": @"",
       @"items": @[
               @{
                   @"image": [UIImage imageNamed:@"Michael.jpeg"],
                   @"story": @[@"[bold: {user}] uploaded [bold: {count|| photo}] to {user| his, her} photo album.", @{
                         @"user": @{
                                @"object": @{@"name": @"Anna", @"gender": @"female"},
                                @"property": @"name"
                         },
                        @"count": @25,
                        @"bold": @{
                                  @"font":@{
                                  @"name": @"system",
                                  @"size": @18,
                                  @"type": @"italic"
                        },
                        @"color": @"red"
                    }
                   }],
                   @"time": @5
                },
               @{
                   @"image": [UIImage imageNamed:@"Margaret.png"],
                   @"story": @[@"[bold: {user}] uploaded [bold: {count|| photo}] to {user| his, her} photo album.", @{
                      @"user": @{
                              @"object": @{@"name": @"Margaret", @"gender": @"female"},
                              @"property": @"name"
                              },
                      @"count": @7,
                      @"bold": @{
                              @"font":@{
                                      @"name": @"system",
                                      @"size": @12,
                                      @"type": @"bold"
                              }
                      },
                    }],
                    @"time": @10
                   },
               @{
                   @"image": [UIImage imageNamed:@"George.png"],
                   @"story": @[@"[bold: {actor}] tagged [bold: {target}] in {count||photo}.", @{
                      @"actor": @{
                              @"object": @{@"name": @"George", @"gender": @"male"},
                              @"property": @"name"
                      },
                      @"target": @{
                              @"object": @{@"name": @"Michael", @"gender": @"male"},
                              @"property": @"name"
                      },
                      @"count": @2,
                      @"bold": @{
                              @"font":@{
                                      @"name": @"system",
                                      @"size": @12,
                                      @"type": @"bold"
                              }
                       },
                      }],
                   @"time": @15
                   },
               @{
                   @"image": [UIImage imageNamed:@"Ian.jpeg"],
                   @"story": @[@"[bold: {actor}] and [bold: {target}] are now friends.", @{
                     @"actor": @{
                             @"object": @{@"name": @"Ian", @"gender": @"male"},
                             @"property": @"name"
                     },
                     @"target": @{
                             @"object": @{@"name": @"George", @"gender": @"male"},
                             @"property": @"name"
                     },
                     @"bold": @{
                             @"font":@{
                                     @"name": @"system",
                                     @"size": @12,
                                     @"type": @"bold"
                                     }
                             }
                     }],
                   @"time": @20
                   },
               @{
                   @"image": [UIImage imageNamed:@"George.png"],
                   @"story": @[@"[bold: {actor}] uploaded a new document.", @{
                    @"actor": @{
                            @"object": @{@"name": @"George", @"gender": @"male"},
                            @"property": @"name"
                            },
                    @"bold": @{
                            @"font":@{
                                    @"name": @"system",
                                    @"size": @12,
                                    @"type": @"bold"
                                    }
                            }
                    }],
                   @"time": @25
                   },
               ]
    }];
}

- (void) translate {
    TmlBeginBlockWithOptions(@{@"source": @"Newsfeed stories"})

    TmlLocalizeViewWithLabel(self.titleLabel, @"Newsfeed");

    TmlEndBlockWithOptions
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TmlBeginBlockWithOptions(@{@"source": @"Newsfeed stories"})

    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedTableViewCell"];
    
    if (cell == nil) {
        cell = [[FeedTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"FeedTableViewCell"];
    }
    
    TmlLocalizeViewWithLabelAndDescription(cell.button1Label, @"Reply", @"Reply to message");
    TmlLocalizeViewWithLabelAndDescription(cell.button2Label, @"Like", @"Like this message");
    
    NSDictionary *section = (NSDictionary *) [self.items objectAtIndex:indexPath.section];
    NSDictionary *item = (NSDictionary *) [[section objectForKey:@"items"] objectAtIndex:indexPath.row];
    
    cell.imageView.image = [item objectForKey:@"image"];

    cell.textView.attributedText = TmlLocalizedAttributedStringWithTokens([[item objectForKey:@"story"] objectAtIndex:0], [[item objectForKey:@"story"] objectAtIndex:1]);
    TmlLocalizeViewWithLabelAndTokens(cell.textView, [[item objectForKey:@"story"] objectAtIndex:0], [[item objectForKey:@"story"] objectAtIndex:1]);
    
    TmlLocalizeViewWithLabelAndTokens(cell.timeLabel, @"{count}m", (@{@"count": [item objectForKey:@"time"]}));
    
    TmlEndBlockWithOptions
    return cell;
}

@end
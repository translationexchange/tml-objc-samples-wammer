//
//  SettingsViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/23/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "SettingsViewController.h"
#import "Tml.h"
#import "TmlLanguageSelectorViewController.h"
#import "TmlTranslatorViewController.h"
#import "UIViewController+Tml.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.items = @[
                   @{
                       @"title": @"",
                       @"items": @[
                               @{
                                   @"title": @"Version",
                                   },
                               @{
                                   @"title": @"Privacy Policy",
                                   },
                               @{
                                   @"title": @"Terms of Use",
                                   },
                               @{
                                   @"title": @"Software Attribution",
                                   },
                               @{
                                   @"title": @"Send Feedback",
                                   }
                               ]
                       },
                   @{
                       @"title": @"Languages",
                       @"items": @[
                               @{
                                   @"title": @"Change Language",
                                   },
                               @{
                                   @"title": @"In-App Translator",
                                   },
                               @{
                                   @"title": @"Open Translator",
                                   },
                               ]
                       },
                   ];
}

- (void) translate {
    TmlLocalizeViewWithLabel(self.titleLabel, @"Settings");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [TmlLanguageSelectorViewController changeLanguageFromController:self];
        } else if (indexPath.row == 1) {
            [TmlTranslatorViewController toggleInAppTranslationsFromController:self];
        } else if (indexPath.row == 2) {
            [TmlTranslatorViewController translateFromController:self];
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TmlBeginBlockWithOptions(@{@"source": @"Settings options"})
    
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

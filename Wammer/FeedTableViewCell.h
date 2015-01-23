//
//  FeedTableViewCell.h
//  Wammer
//
//  Created by Michael Berkovich on 2/23/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) IBOutlet UILabel *timeLabel;

@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;

@property (nonatomic, strong) IBOutlet UITextView *textView;

@property (nonatomic, strong) IBOutlet UILabel *button1Label;

@property (nonatomic, strong) IBOutlet UILabel *button2Label;

@property (nonatomic, strong) IBOutlet UIView *buttonsView;

@end

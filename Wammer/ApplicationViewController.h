//
//  ApplicationViewController.h
//  Wammer
//
//  Created by Michael Berkovich on 2/23/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationViewController : UIViewController 

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

- (IBAction) toggleMenu:(id)sender;

- (void) translate;

@end

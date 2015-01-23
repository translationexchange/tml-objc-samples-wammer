//
//  ApplicationViewController.m
//  Wammer
//
//  Created by Michael Berkovich on 2/23/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "ApplicationViewController.h"
#import "IIViewDeckController.h"
#import "Tml.h"

@interface ApplicationViewController ()

@end

@implementation ApplicationViewController

@synthesize titleLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(translationsLoaded)
                                                 name:TmlLanguageChangedNotification
                                               object:self.view.window];
    
    [self translate];
}

- (IBAction)toggleMenu:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (void) translate {
    
}

- (void) translationsLoaded {
    [self translate];
}

@end


//
//  AppDelegate.m
//  Wammer
//
//  Created by Michael Berkovich on 2/22/14.
//  Copyright (c) 2014 TmlHub Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "Tml.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc]
                                             initWithCenterViewController:[mainStoryboard
                                                                           instantiateViewControllerWithIdentifier:
                                                                           @"NavigationViewController"]
                                             
                                             leftViewController:[mainStoryboard
                                                                 instantiateViewControllerWithIdentifier:
                                                                 @"MenuViewController"]];

  
    [Tml sharedInstanceWithToken:@"0ad08017354a47ed00073fb2825d5e97fecffb87764cba7ee60bd624022e43dd"];
    
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

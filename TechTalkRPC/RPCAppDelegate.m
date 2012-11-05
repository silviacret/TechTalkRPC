//
//  RPCAppDelegate.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/5/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCAppDelegate.h"
#import "RPCViewController.h"
#import "RPCRotatableNavigationController.h"

@implementation RPCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    RPCViewController *vc = [[RPCViewController alloc] init];
    RPCRotatableNavigationController *navController = [[RPCRotatableNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navController;
    
    return YES;
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    //return UIInterfaceOrientationMaskLandscape;
    return UIInterfaceOrientationMaskAll;
}

@end

//
//  RPCNonRotatableNavigationController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/5/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCNonRotatableNavigationController.h"

@interface RPCNonRotatableNavigationController ()

@end

@implementation RPCNonRotatableNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end

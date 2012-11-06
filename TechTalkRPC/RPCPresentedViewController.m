//
//  RPCPresentedViewController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/6/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCPresentedViewController.h"

@interface RPCPresentedViewController ()

@end

@implementation RPCPresentedViewController

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
    return UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

@end

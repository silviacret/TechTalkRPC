//
//  RPCViewController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/5/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCViewController.h"

@interface RPCViewController ()

@end

@implementation RPCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label1];
    label1.text = @"label 1";
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label2];
    label2.text = @"label 2";

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label3];
    label3.text = @"label 3";

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:label4];
    label4.text = @"label 4";
    
    // add constraints
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

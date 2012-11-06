//
//  RPCViewController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/5/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCViewController.h"
#import "RPCNonRotatableNavigationController.h"
#import "RPCPresentedViewController.h"

@interface RPCViewController ()

@end

@implementation RPCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    label1.translatesAutoresizingMaskIntoConstraints = NO;
    label1.text = @"label 1";
    [self.view addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    label2.translatesAutoresizingMaskIntoConstraints = NO;
    label2.text = @"label 2";
    [self.view addSubview:label2];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectZero];
    label3.translatesAutoresizingMaskIntoConstraints = NO;
    label3.text = @"label 3";
    [self.view addSubview:label3];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectZero];
    label4.translatesAutoresizingMaskIntoConstraints = NO;
    label4.text = @"label 4";
    [self.view addSubview:label4];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"present" forState:UIControlStateNormal] ;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // add constraints
    
    // position label 1: 50.0 from left margin, 50.0 from top margin of the current view
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:50.0];
    [self.view addConstraint:constraint1];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:50.0];
    [self.view addConstraint:constraint2];
    
    // position label 2 to be aligned with label 1 (same centerY)
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:label2 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint3];
    
    // position label 4 to be aligned with label 3 (same centerY)
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:label4 attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint4];
    
    // position label 3 to be aligned with label 1 (same centerX)
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:label1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint5];
    
    // position label 3 to be 50.0 beneath label 1
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:label3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50.0];
    [self.view addConstraint:constraint6];
    
    // position label 2 to be 100.0 on the right 
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:label2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label1 attribute:NSLayoutAttributeRight multiplier:1.0 constant:100.0];
    [self.view addConstraint:constraint7];
    
    // position label 4 to be 100.0 on the right
    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:label4 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:label3 attribute:NSLayoutAttributeRight multiplier:1.0 constant:100.0];
    [self.view addConstraint:constraint8];

    // position button to be centered
    NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    [self.view addConstraint:constraint9];
    
    // position button to be 20.0 above the lower margin of the current view
    NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBaseline multiplier:1.0 constant:-50.0];
    [self.view addConstraint:constraint10];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)buttonClicked:(id)sender {
    RPCNonRotatableNavigationController *navController = [[RPCNonRotatableNavigationController alloc] initWithRootViewController:[[RPCPresentedViewController alloc] initWithNibName:nil bundle:nil]];
    [self presentViewController:navController animated:YES completion:nil];
}

@end

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

- (void)button1Clicked:(id)sender;
- (void)button2Clicked:(id)sender;
- (void)button3Clicked:(id)sender;
- (void)button4Clicked:(id)sender;
- (void)buttonClicked:(id)sender;

@end

@implementation RPCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    // add subviews
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:@"This is a view which doesn't support rotation, but it's navigation controller does support rotation in all interface orientations"];
    label.numberOfLines = 3;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //button1.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setTitle:@"button 1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    //button2.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    [button2 setTitle:@"button 2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.translatesAutoresizingMaskIntoConstraints = NO;
    //button3.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    [button3 setTitle:@"button 3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.translatesAutoresizingMaskIntoConstraints = NO;
    //button4.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    [button4 setTitle:@"button 4" forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(button4Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"present" forState:UIControlStateNormal] ;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    // add constraints
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////

    NSLayoutConstraint *constraint11 = [NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0];
    [self.view addConstraint:constraint11];
    
    NSLayoutConstraint *constraint12 = [NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:0.1
                                                                     constant:0.0];
    [self.view addConstraint:constraint12];
    
    NSLayoutConstraint *constraint13 = [NSLayoutConstraint constraintWithItem:label
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:-30.0];
    [self.view addConstraint:constraint13];
    
    // position button 1: 50.0 from left margin, 70.0 from top margin of the current view
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:button1
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint1];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:button1
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:70.0];
    [self.view addConstraint:constraint2];
    
    // position button 2 to be aligned with button 1 (same centerY)
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:button1
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button2
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint3];
    
    // position button 4 to be aligned with button 3 (same centerY)
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:button3
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button4
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint4];
    
    // position button 3 to be aligned with button 1 (same centerX)
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:button1
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button3
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint5];
    
    // position button 3 to be 50.0 beneath button 1
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:button3
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button1
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint6];
    
    // position button 2 to be 50.0 on the right 
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:button2
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button1
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint7];
    
    // position button 4 to be 50.0 on the right
    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:button4
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button3
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint8];

    // position button to be centered
    NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:button
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint9];
    
    // position button to be 20.0 above the lower margin of the current view
    NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:button
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeBaseline
                                                                   multiplier:1.0
                                                                     constant:-50.0];
    [self.view addConstraint:constraint10];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)button1Clicked:(id)sender {
}

- (void)button2Clicked:(id)sender {
}

- (void)button3Clicked:(id)sender {
}

- (void)button4Clicked:(id)sender {
}

- (void)buttonClicked:(id)sender {
    RPCNonRotatableNavigationController *navController = [[RPCNonRotatableNavigationController alloc] initWithRootViewController:[[RPCPresentedViewController alloc] initWithNibName:nil bundle:nil]];
    [self presentViewController:navController animated:YES completion:nil];
}

@end

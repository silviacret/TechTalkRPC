//
//  RPCPresentedViewController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/6/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCPresentedViewController.h"

@interface RPCPresentedViewController () {
    UIImageView *_red;
    UIImageView *_blue;
    UIImageView *_green;
    UIImageView *_steel;
    UIImageView *_black;
}

- (void)button1Clicked:(id)sender;
- (void)button2Clicked:(id)sender;
- (void)buttonClicked:(id)sender;

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    // add subviews
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:@"This is a view which supports rotation in all interface orientations, but it's navigation controller doesn't"];
    label.numberOfLines = 3;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //button1.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setTitle:@"anim 1" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    //button2.frame = CGRectMake(0.0, 0.0, 100.0, 50.0);
    [button2 setTitle:@"anim 2" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"dismiss" forState:UIControlStateNormal] ;
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIView *view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor yellowColor];
    
    _red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Red_pog.png"]];
    _red.translatesAutoresizingMaskIntoConstraints = NO;
    _red.frame = CGRectMake(12.0, 12.0, 32.0, 32.0);
    [view addSubview:_red];
    
    _blue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Blue_pog.png"]];
    _blue.translatesAutoresizingMaskIntoConstraints = NO;
    _blue.frame = CGRectMake(82.0, 12.0, 32.0, 32.0);
    [view addSubview:_blue];
    
    _green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_pog.png"]];
    _green.translatesAutoresizingMaskIntoConstraints = NO;
    _green.frame = CGRectMake(10.0, 82.0, 32.0, 32.0);
    [view addSubview:_green];
    
    _steel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Steel_pog.png"]];
    _steel.translatesAutoresizingMaskIntoConstraints = NO;
    _steel.frame = CGRectMake(64.0, 60.0, 32.0, 32.0);
   [view addSubview:_steel];
    
    _black = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Black_pog.png"]];
    _black.translatesAutoresizingMaskIntoConstraints = NO;
    _black.frame = CGRectMake(60.0, 100.0, 32.0, 32.0);
   [view addSubview:_black];
    
    [self.view addSubview:view];
    
    
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
    
    // position button 2 to be 50.0 on the right
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:button2
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button1
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint7];
    
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
    
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button1
                                                                   attribute:NSLayoutAttributeBottom
                                                                  multiplier:1.0
                                                                    constant:10.0];
    [self.view addConstraint:constraint4];
    
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:button
                                                                   attribute:NSLayoutAttributeTop
                                                                  multiplier:1.0
                                                                    constant:-10.0];
    [self.view addConstraint:constraint5];
    
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1.0
                                                                    constant:-40.0];
    [self.view addConstraint:constraint6];
    
    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:view
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:20.0];
    [self.view addConstraint:constraint8];
    
    
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

- (void)button1Clicked:(id)sender {
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:_blue
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_red
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:10.0];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:_green
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_blue
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:10.0];
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:_steel
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_green
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:10.0];
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:_black
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_steel
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:10.0];

    
    [UIView animateWithDuration:5.0
                          delay:1.0
                        options: UIViewAnimationCurveLinear
                     animations:^{
                         [self.view addConstraint:constraint1];
                         [self.view addConstraint:constraint2];
                         [self.view addConstraint:constraint3];
                         [self.view addConstraint:constraint4];
                    } 
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
}

- (void)button2Clicked:(id)sender {
}

- (void)buttonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

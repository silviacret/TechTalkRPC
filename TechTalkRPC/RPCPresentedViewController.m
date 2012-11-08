//
//  RPCPresentedViewController.m
//  TechTalkRPC
//
//  Created by Silvia Cret on 11/6/12.
//  Copyright (c) 2012 Silvia Cret. All rights reserved.
//

#import "RPCPresentedViewController.h"

@interface RPCPresentedViewController () {
    UILabel *_label;
    UIButton *_button1;
    UIButton *_button2;
    UIButton *_button;
    UIView *_someView;
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
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectZero];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [_label setText:@"This is a view which supports rotation in all interface orientations, but it's navigation controller doesn't"];
    _label.numberOfLines = 3;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:_label];
    
    _button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button1.translatesAutoresizingMaskIntoConstraints = NO;
    [_button1 setTitle:@"anim 1" forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button1];
    
    _button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button2.translatesAutoresizingMaskIntoConstraints = NO;
    [_button2 setTitle:@"anim 2" forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button2];
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_button setTitle:@"dismiss" forState:UIControlStateNormal] ;
    _button.translatesAutoresizingMaskIntoConstraints = NO;
    [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    _someView = [[UIView alloc] init];
    _someView.translatesAutoresizingMaskIntoConstraints = NO;
    _someView.backgroundColor = [UIColor yellowColor];
    
    _red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Red_pog.png"]];
    _red.translatesAutoresizingMaskIntoConstraints = NO;
    _red.frame = CGRectMake(12.0, 12.0, 32.0, 32.0);
    [_someView addSubview:_red];
    
    _blue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Blue_pog.png"]];
    _blue.translatesAutoresizingMaskIntoConstraints = NO;
    _blue.frame = CGRectMake(82.0, 12.0, 32.0, 32.0);
    [_someView addSubview:_blue];
    
    _green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Green_pog.png"]];
    _green.translatesAutoresizingMaskIntoConstraints = NO;
    _green.frame = CGRectMake(10.0, 82.0, 32.0, 32.0);
    [_someView addSubview:_green];
    
    _steel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Steel_pog.png"]];
    _steel.translatesAutoresizingMaskIntoConstraints = NO;
    _steel.frame = CGRectMake(64.0, 60.0, 32.0, 32.0);
   [_someView addSubview:_steel];
    
    _black = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Black_pog.png"]];
    _black.translatesAutoresizingMaskIntoConstraints = NO;
    _black.frame = CGRectMake(60.0, 100.0, 32.0, 32.0);
   [_someView addSubview:_black];
    
    [self.view addSubview:_someView];

}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    // add constraints
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:_label
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint1];
    
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:_label
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:0.1
                                                                    constant:0.0];
    [self.view addConstraint:constraint2];
    
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:_label
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1.0
                                                                    constant:-30.0];
    [self.view addConstraint:constraint3];
    
    // position button 1: 50.0 from left margin, 70.0 from top margin of the current view
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:_button1
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint4];
    
    NSLayoutConstraint *constraint5 = [NSLayoutConstraint constraintWithItem:_button1
                                                                   attribute:NSLayoutAttributeTop
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeLeading
                                                                  multiplier:1.0
                                                                    constant:70.0];
    [self.view addConstraint:constraint5];
    
    // position button 2 to be aligned with button 1 (same centerY)
    NSLayoutConstraint *constraint6 = [NSLayoutConstraint constraintWithItem:_button1
                                                                   attribute:NSLayoutAttributeCenterY
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_button2
                                                                   attribute:NSLayoutAttributeCenterY
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint6];
    
    // position button 2 to be 50.0 on the right
    NSLayoutConstraint *constraint7 = [NSLayoutConstraint constraintWithItem:_button2
                                                                   attribute:NSLayoutAttributeLeft
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:_button1
                                                                   attribute:NSLayoutAttributeRight
                                                                  multiplier:1.0
                                                                    constant:50.0];
    [self.view addConstraint:constraint7];
    
    // position button to be centered
    NSLayoutConstraint *constraint8 = [NSLayoutConstraint constraintWithItem:_button
                                                                   attribute:NSLayoutAttributeCenterX
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeCenterX
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:constraint8];
    
    // position button to be 20.0 above the lower margin of the current view
    NSLayoutConstraint *constraint9 = [NSLayoutConstraint constraintWithItem:_button
                                                                   attribute:NSLayoutAttributeBottom
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.view
                                                                   attribute:NSLayoutAttributeBaseline
                                                                  multiplier:1.0
                                                                    constant:-50.0];
    [self.view addConstraint:constraint9];
    
    NSLayoutConstraint *constraint10 = [NSLayoutConstraint constraintWithItem:_someView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_button1
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0];
    [self.view addConstraint:constraint10];
    
    NSLayoutConstraint *constraint11 = [NSLayoutConstraint constraintWithItem:_someView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_button
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:-10.0];
    [self.view addConstraint:constraint11];
    
    NSLayoutConstraint *constraint12 = [NSLayoutConstraint constraintWithItem:_someView
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:-40.0];
    [self.view addConstraint:constraint12];
    
    NSLayoutConstraint *constraint13 = [NSLayoutConstraint constraintWithItem:_someView
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.view
                                                                    attribute:NSLayoutAttributeLeading
                                                                   multiplier:1.0
                                                                     constant:20.0];
    [self.view addConstraint:constraint13];
    
    NSLayoutConstraint *constraint14 = [NSLayoutConstraint constraintWithItem:_blue
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_red
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:10.0];
    [self.view addConstraint:constraint14];
    
    NSLayoutConstraint *constraint15 = [NSLayoutConstraint constraintWithItem:_blue
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_red
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0];
    [self.view addConstraint:constraint15];
    
    NSLayoutConstraint *constraint16 = [NSLayoutConstraint constraintWithItem:_green
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_blue
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:10.0];
    [self.view addConstraint:constraint16];
    
    NSLayoutConstraint *constraint17 = [NSLayoutConstraint constraintWithItem:_green
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_blue
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0];
    [self.view addConstraint:constraint17];
    
    NSLayoutConstraint *constraint18 = [NSLayoutConstraint constraintWithItem:_steel
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_green
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:10.0];
    [self.view addConstraint:constraint18];
    
    NSLayoutConstraint *constraint19 = [NSLayoutConstraint constraintWithItem:_steel
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_green
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0];
    [self.view addConstraint:constraint19];
    
    NSLayoutConstraint *constraint20 = [NSLayoutConstraint constraintWithItem:_black
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_steel
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:10.0];
    [self.view addConstraint:constraint20];
    
    NSLayoutConstraint *constraint21 = [NSLayoutConstraint constraintWithItem:_black
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_steel
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0];
    [self.view addConstraint:constraint21];
    
    [self.view updateConstraints];
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
    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options: UIViewAnimationCurveLinear
                     animations:^{
                         CGRect frame = _red.frame;
                         frame.origin = CGPointMake(12.0, 100.0);
                         _red.frame = frame;
                         
                    }
                     completion:^(BOOL finished){
                         [self updateViewConstraints];
                     }];
}

- (void)button2Clicked:(id)sender {
}

- (void)buttonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

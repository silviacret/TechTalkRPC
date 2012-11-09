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
#import <AdSupport/AdSupport.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface RPCViewController ()

- (void)button1Clicked:(id)sender;
- (void)button2Clicked:(id)sender;
- (void)button3Clicked:(id)sender;
- (void)button4Clicked:(id)sender;
- (void)buttonClicked:(id)sender;
- (void)addressbookAuthorizationStateDecided:(BOOL)granted;

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
#warning If you don't set translatesAutoresizingMaskIntoConstraints to NO for programatically created views, you'll get unsatisfiable constraint warning (WARNING: Unable to simultaneously satisfy constraints.)
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:@"This is a view which doesn't support rotation, but it's navigation controller does support rotation in all interface orientations"];
    label.numberOfLines = 3;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:label];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    [button1 setTitle:@"UDID" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    [button2 setTitle:@"Contacts" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.translatesAutoresizingMaskIntoConstraints = NO;
    [button3 setTitle:@"button 3" forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(button3Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.translatesAutoresizingMaskIntoConstraints = NO;
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
#warning If you comment this you'll get AMBIGUITY and button2 will not be Y positioned
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
    
#warning This constraint leads to unsatisfiable constraints applied to button (WARNING: Unable to simultaneously satisfy constraints.)
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:button
//                                                                    attribute:NSLayoutAttributeBottom
//                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                                       toItem:self.view
//                                                                    attribute:NSLayoutAttributeBaseline
//                                                                   multiplier:1.0
//                                                                     constant:60.0];
//    [self.view addConstraint:constraint];

#warning This constraint leads to satisfying the constraints in an unexpected way (WARNING: Unable to simultaneously satisfy constraints.)
//    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:button
//                                                                    attribute:NSLayoutAttributeBottom
//                                                                    relatedBy:NSLayoutRelationEqual
//                                                                       toItem:self.view
//                                                                    attribute:NSLayoutAttributeBaseline
//                                                                   multiplier:1.0
//                                                                     constant:-100.0];
//    [self.view addConstraint:constraint];
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)button1Clicked:(id)sender {
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"UDID"
                                                     message:[NSString stringWithFormat:@"%@ \n\n %@ \n\n %@", [[NSUUID UUID] UUIDString], [[[UIDevice currentDevice] identifierForVendor] UUIDString], [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString]]
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
    [alert1 show];
}

- (void)button2Clicked:(id)sender {
    CFErrorRef abError = NULL;
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &abError);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    ABRecordRef person = NULL;
    NSLog(@"%ld contacts", nPeople);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{[self addressbookAuthorizationStateDecided:granted];});
        });
    } else {//if ((ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) && !abError && addressBook) {
//        CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
//        if (nPeople > 0) {
//            person = CFArrayGetValueAtIndex(people, 0);
//        }
//        
//        ABPersonViewController *controller = [[ABPersonViewController alloc] init];
//        controller.addressBook = addressBook;
//        controller.displayedPerson = person;
//        controller.allowsEditing = YES;
//        controller.hidesBottomBarWhenPushed = YES;
//        controller.editing = YES;
//        self.navigationController.navigationBar.tintColor = nil;
//        [self.navigationController pushViewController:controller animated:YES];
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        
//        // Vasile: Beware of crashes
//        if (people) {
//            CFRelease(people);
//        }
        
        
        // ABNewPersonViewController
        ABRecordRef personRef = ABPersonCreate();
        
        ABMultiValueRef multiValueRef = ABMultiValueCreateMutable(kABMultiStringPropertyType);
        if (ABMultiValueAddValueAndLabel(multiValueRef, @"1234", kABPersonPhoneMobileLabel, NULL) == YES) {
            CFErrorRef anError = NULL;
            ABRecordSetValue(personRef, kABPersonPhoneProperty, multiValueRef, &anError);
        }
        
        if (ABMultiValueAddValueAndLabel(multiValueRef, @"oooo@k.ro", kABOtherLabel, NULL) == YES) {
            CFErrorRef anError = NULL;
            ABRecordSetValue(personRef, kABPersonEmailProperty, multiValueRef, &anError);
        }
        
        ABRecordSetValue(personRef, kABPersonOrganizationProperty, @"SV", NULL);
        
        ABNewPersonViewController *controller = [[ABNewPersonViewController alloc] init];
        controller.newPersonViewDelegate = self;
        controller.addressBook = addressBook;
        controller.displayedPerson = personRef;
        
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
        [self.navigationController presentViewController:navigation animated:YES completion:NULL];
        
        CFRelease(personRef);
        CFRelease(multiValueRef);
        
        // Vasile: Beware of crashes
        if (addressBook) {
            CFRelease(addressBook);
        }
    }
}

- (void)button3Clicked:(id)sender {
    EKEventStore *ekStore = [[EKEventStore alloc] init];
    if ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusNotDetermined) {
        [ekStore requestAccessToEntityType:EKEntityTypeReminder completion:NULL];
    }
}

- (void)button4Clicked:(id)sender {
    ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
    [lib addAssetsGroupAlbumWithName:@"TestRPC" resultBlock:^(ALAssetsGroup *group) {
        NSLog(@"Success! Group created!!!");
    } failureBlock:^(NSError *error) {
         NSLog(@"Failure! Error is: %@, %@", error.localizedFailureReason, error.localizedDescription);
    }];
}

- (void)buttonClicked:(id)sender {
    RPCNonRotatableNavigationController *navController = [[RPCNonRotatableNavigationController alloc] initWithRootViewController:[[RPCPresentedViewController alloc] initWithNibName:nil bundle:nil]];
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)addressbookAuthorizationStateDecided:(BOOL)granted {
    [self button2Clicked:nil];
}

#pragma mark -
#pragma mark ABNewPersonViewControllerDelegate

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonViewController didCompleteWithNewPerson:(ABRecordRef)person {
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}

@end

//
//  ViewController.m
//  Standup
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "ViewController.h"
@import Shared;

@interface ViewController ()
@end

@implementation ViewController {
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[SharedDefaults center].stoodUp = NO;
	_stoodSwitch.on = NO;
	[SharedDefaults center].standUpNotification = @"Sitting";
	_notificationField.text = [SharedDefaults center].standUpNotification;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)stoodToggle:(id)sender {
	[SharedDefaults center].stoodUp = _stoodSwitch.on;
}
- (IBAction)walk500Button:(id)sender {
    NSInteger steps = [SharedDefaults center].steps;
    steps += 500;
    [SharedDefaults center].steps = steps;
    [SharedDefaults center].lastStandUp = [NSDate date];
}

- (IBAction)notificationChanged:(id)sender {
	[SharedDefaults center].standUpNotification = _notificationField.text;
}

#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[_notificationField resignFirstResponder];
	return YES;
}

@end

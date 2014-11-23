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

	[SharedDefaults center].stoodUp = YES;
	[SharedDefaults center].standUpNotification = @"Stood up!";
    [SharedDefaults center].steps = 3000;
    [SharedDefaults center].lastStandUp = [NSDate date];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}




@end

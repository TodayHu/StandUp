//
//  ViewController.m
//  Standup
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController {
}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    
    [self saveToDefualts];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//save the nsuserdefaults

-(void)saveToDefualts
{
    
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.standup"];
    
    NSString * standUp = @"Stand Up!";
    
    
    [sharedDefaults setValue:standUp forKey:@"standUpNotification"];
    [sharedDefaults setBool:NO forKey:@"hasStoodUp"];
    
    
    
    [sharedDefaults synchronize];
    
}



@end

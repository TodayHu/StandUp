//
//  GlanceController.m
//  Standup WatchKit Extension
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "GlanceController.h"
@import Shared;

@interface GlanceController()
@property (nonatomic) NSTimer *timer;

@property NSString * standUpText;
@property BOOL  isStandingUp;

@property (weak, nonatomic) IBOutlet WKInterfaceTimer *sitTimer;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *timerLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *detailText;

@property (strong, nonatomic) NSDate* lastTimeStanding;

@end


@implementation GlanceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
    
	// load from stored data
	if (!self.timer) {
		self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateData:) userInfo:nil repeats:YES];
	}
	[self configureGlance];
}

- (void)configureGlance {
	//notification text
	self.standUpText = [SharedDefaults center].standUpNotification;

	//if the person is standing up, hide the timer
	self.isStandingUp = [SharedDefaults center].stoodUp;

	// Last time the person stood up and moved
	self. lastTimeStanding = [SharedDefaults center].lastStandUp;


	// TESTTING - remove this:
	//self.isStandingUp = true;
	///////////////////////////////

	[self.sitTimer setHidden:self.isStandingUp];
	[self.timerLabel setText: !self.isStandingUp ?
	 @"Sitting for:" : @"You're Standing."];

	if ((!self.lastTimeStanding || self.isStandingUp))
	{
		self.lastTimeStanding = [NSDate date];
	}

	NSDate* timerStartDate = self.lastTimeStanding;

	timerStartDate = self.lastTimeStanding;

	NSLog(@"Setting timer date to %@", timerStartDate);
	[self.sitTimer setDate:timerStartDate];
	[self.sitTimer start];

	if (self.isStandingUp)
	{
		[self.detailText setText:@"Great!"];
	}
	else if (self.standUpText)
	{
		[self.detailText setText:self.standUpText];
	}
	else
	{
		[self.detailText setText:@"Get up and move!"];
	}
}

- (void)updateData:(NSTimer *)timer {
	[self configureGlance];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end




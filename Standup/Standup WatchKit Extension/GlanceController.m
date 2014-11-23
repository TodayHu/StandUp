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

@property NSString * standUpText;
@property BOOL  hasStoodUp;

@property (weak, nonatomic) IBOutlet WKInterfaceTimer *sitTimer;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *timerLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *detailText;

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
    
    //notification text
	self.standUpText = [SharedDefaults center].standUpNotification;

    //if the person stood up...
	self.hasStoodUp = [SharedDefaults center].stoodUp;
//    NSDate* lastTimeStanding =
    if (self.hasStoodUp)
    {
//        [self.sitTimer setDate:<#(NSDate *)#>];
    }
    else
    {

    }

    [self.sitTimer start];

    [self.detailText setText:self.standUpText];

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end




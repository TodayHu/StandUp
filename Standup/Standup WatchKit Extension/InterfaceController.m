//
//  InterfaceController.m
//  Standup WatchKit Extension
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "InterfaceController.h"
@import Shared;


@interface InterfaceController()
@property (nonatomic) NSTimer *timer;
@end


@implementation InterfaceController

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
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
    [self.timer invalidate];
    self.timer = nil;
}

- (void)updateData:(NSTimer *)timer {
    NSInteger steps = [SharedDefaults center].steps;
    NSDate *date = [SharedDefaults center].lastStandUp;
    
    [self updateDisplayWithSteps:steps andLastTime:date];
}


- (void)updateDisplayWithSteps:(NSInteger)steps andLastTime:(NSDate *)date {
    [self.stepsCounter setText:[NSString stringWithFormat:@"%@", @(steps)]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd 'at' HH:mm"];

    
    NSString *formattedDateString = date ? [dateFormatter stringFromDate:date] : @"No record found!";
    
    [self.lastTime setText:formattedDateString];

}
@end




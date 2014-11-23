//
//  InterfaceController.m
//  Standup WatchKit Extension
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

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
    [self updateDisplayWithSteps:300 andLastTime:[NSDate date]];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}


- (void)updateDisplayWithSteps:(NSInteger)steps andLastTime:(NSDate *)date {
    [self.stepsCounter setText:[NSString stringWithFormat:@"%@", @(steps)]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd 'at' HH:mm"];
    
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    [self.lastTime setText:formattedDateString];

}
@end




//
//  SharedDefaults.m
//  Standup
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import "SharedDefaults.h"

SharedDefaults * theDefaults;

@implementation SharedDefaults {
	NSUserDefaults * _defaults;
}

static NSString * hasStoodUpKey = @"hasStoodUp";
static NSString * notificationKey = @"standUpNotification";
static NSString * stepsKey = @"steps";
static NSString * lastStandUpKey = @"lastStandUp";

+(SharedDefaults *)center {
	static dispatch_once_t token;

	dispatch_once(&token, ^{
		theDefaults = [SharedDefaults new];
	});
	return theDefaults;
}

- (void)setStoodUp:(BOOL)stoodUp {
	[_defaults setBool:stoodUp forKey:hasStoodUpKey];
	[_defaults synchronize];
}

- (BOOL)stoodUp {
	return [_defaults boolForKey:hasStoodUpKey];
}

- (void)setStandUpNotification:(NSString *)standUpNotification {
	[_defaults setValue:standUpNotification forKey:notificationKey];
	[_defaults synchronize];
}

- (NSString *)standUpNotification {
	return [_defaults valueForKey:notificationKey];
}

- (void)setSteps:(NSInteger)steps {
    [_defaults setInteger:steps forKey:stepsKey];
    [_defaults synchronize];
}

- (NSInteger)steps {
	return [[_defaults valueForKey:stepsKey] integerValue];
}

- (void)setLastStandUp:(NSDate *)lastStoodup {
    [_defaults setValue:lastStoodup forKey:lastStandUpKey];
    [_defaults synchronize];
}

- (NSDate *)lastStandUp {
	return [_defaults valueForKey:lastStandUpKey];
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		_defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.standup"];
	}
	return self;
}

@end

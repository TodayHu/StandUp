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

+(SharedDefaults *)center {
	static dispatch_once_t token;

	dispatch_once(&token, ^{
		theDefaults = [SharedDefaults new];
	});
	return theDefaults;
}

- (void)setStoodUp:(BOOL)stoodUp {
	_stoodUp = stoodUp;
	[_defaults setBool:stoodUp forKey:@"hasStoodUp"];
	[_defaults synchronize];
}

- (void)setStandUpNotification:(NSString *)standUpNotification {
	_standUpNotification = standUpNotification;
	[_defaults setValue:standUpNotification forKey:@"standUpNotification"];
	[_defaults synchronize];
}

- (void)setSteps:(NSInteger)steps {
    _steps = steps;
    [_defaults setInteger:steps forKey:@"steps"];
    [_defaults synchronize];
}

- (void)setLastStandUp:(NSDate *)lastStoodup {
    _lastStandUp = lastStoodup;
    [_defaults setValue:lastStoodup forKey:@"lastStandUp"];
    [_defaults synchronize];
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

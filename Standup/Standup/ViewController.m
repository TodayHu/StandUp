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
	UIUserNotificationSettings * _settings;
	NSSet * _notificationCategories;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	[self registerSettingsAndCategories];
}

- (IBAction)testSendNotification:(id)sender {
	UILocalNotification * notification = [UILocalNotification new];
	notification.category = @"invitation";
//	notification.

	[[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 Cribbed from https://developer.apple.com/library/prerelease/ios/documentation/General/Conceptual/WatchKitProgrammingGuide/BasicSupport.html#//apple_ref/doc/uid/TP40014969-CH18-SW1
*/

- (void)registerSettingsAndCategories {
	// Create a mutable set to store the category definitions.
	NSMutableSet* categories = [NSMutableSet set];

	// Define the actions for a meeting invite notification.
	UIMutableUserNotificationAction* acceptAction = [[UIMutableUserNotificationAction alloc] init];
	acceptAction.title = NSLocalizedString(@"Accept", @"Accept invitation");
	acceptAction.identifier = @"accept";
	acceptAction.activationMode = UIUserNotificationActivationModeBackground;
	acceptAction.authenticationRequired = NO;

	UIMutableUserNotificationAction* declineAction = [[UIMutableUserNotificationAction alloc] init];
	declineAction.title = NSLocalizedString(@"Decline", @"Decline invitation");
	declineAction.identifier = @"decline";
	declineAction.activationMode = UIUserNotificationActivationModeBackground;
	declineAction.authenticationRequired = NO;

	// Create the category object and add it to the set.
	UIMutableUserNotificationCategory* inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
	[inviteCategory setActions:@[acceptAction, declineAction]
					forContext:UIUserNotificationActionContextDefault];
	inviteCategory.identifier = @"invitation";

	[categories addObject:inviteCategory];

	// Configure other actions and categories and add them to the set...

	_settings = [UIUserNotificationSettings settingsForTypes:
				 (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
												  categories:categories];
	_notificationCategories = [categories copy];

	[[UIApplication sharedApplication] registerUserNotificationSettings:_settings];
}
@end

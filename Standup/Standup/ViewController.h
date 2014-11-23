//
//  ViewController.h
//  Standup
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *notificationField;
@property (weak, nonatomic) IBOutlet UISwitch *stoodSwitch;

- (IBAction)stoodToggle:(id)sender;
- (IBAction)notificationChanged:(id)sender;

@end


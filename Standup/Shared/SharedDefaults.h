//
//  SharedDefaults.h
//  Standup
//
//  Created by Timothy Sanders on 2014-11-23.
//  Copyright (c) 2014 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedDefaults : NSObject

+ (SharedDefaults *) center;

@property (nonatomic) BOOL stoodUp;
@property (nonatomic) NSString * standUpNotification;

@end

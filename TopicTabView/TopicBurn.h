//
//  TopicBurn.h
//  TopicTabView
//
//  Created by dell on 14-6-9.
//  Copyright (c) 2014年 dell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicBurn : NSObject
@property(nonatomic,copy)NSString *numberOne;
@property(nonatomic,copy)NSString *operators;
@property(nonatomic,copy)NSString *numberTwo;
+(id)topicburnWithNumber:(NSString*)numberOne operators:(NSString*)operators numberTwo:(NSString*)numberTwo;
@end

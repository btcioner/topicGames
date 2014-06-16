//
//  TopicBurn.m
//  TopicTabView
//
//  Created by dell on 14-6-9.
//  Copyright (c) 2014年 dell. All rights reserved.
//

#import "TopicBurn.h"

@implementation TopicBurn
+(id)topicburnWithNumber:(NSString *)numberOne operators:(NSString *)operators numberTwo:(NSString *)numberTwo
{
    TopicBurn *p=[[TopicBurn alloc]init];
    p.numberOne=numberOne;
    p.numberTwo=numberTwo;
    p.operators=operators;
    return p;
}
@end

//
//  TopicViewController.h
//  TopicTabView
//
//  Created by dell on 14-6-9.
//  Copyright (c) 2014年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicViewController : UIViewController
{
    NSArray *_allTopic;
    NSArray *_operatorArry;
}
@property (weak, nonatomic) IBOutlet UITableView *tabView;
- (IBAction)refreshButton:(id)sender;

@end

//
//  TopicViewController.m
//  TopicTabView
//
//  Created by dell on 14-6-9.
//  Copyright (c) 2014年 dell. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicBurn.h"

@interface TopicViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@end

@implementation TopicViewController
{
    int grade;
}
#pragma mark 先初始化模型数据
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [_tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    _operatorArry = @[@"+", @"-", @"×", @"÷",@"&",@"|",@"⊕",@"⊙"];  //将运算符导进数组
    
    //将数据发送给模型
    
    TopicBurn *tone = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i", arc4random() % 100]
                                           operators:_operatorArry[(arc4random()% 100)%(_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i", arc4random() % 100]];
    TopicBurn *ttwo = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i", arc4random() % 100]
                                           operators:_operatorArry[(arc4random()% 100)% (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i", arc4random()% 100]];
    TopicBurn *tthree = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i", arc4random()% 100]
                                             operators:_operatorArry[(arc4random()% 100)% (_operatorArry.count)]
                                             numberTwo:[NSString stringWithFormat:@"%i", arc4random()% 100]];
    TopicBurn *tfour = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i",arc4random() % 100]
                                           operators:_operatorArry[(arc4random()% 100)% (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i",arc4random() % 100]];
    TopicBurn *tfive = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i",arc4random() % 100]
                                           operators:_operatorArry[(arc4random()% 100)% (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i",arc4random() % 100]];
    TopicBurn *tsix = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i",arc4random() % 100]
                                           operators:_operatorArry[(arc4random() % 100) % (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i",arc4random() % 100]];
    TopicBurn *tseven = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i",arc4random()%100]
                                           operators:_operatorArry[(arc4random()%100) % (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i",arc4random()%100]];
    TopicBurn *teight = [TopicBurn topicburnWithNumber:[NSString stringWithFormat:@"%i",arc4random()%100]
                                           operators:_operatorArry[(arc4random()%100) % (_operatorArry.count)]
                                           numberTwo:[NSString stringWithFormat:@"%i",arc4random()%100]];
    //将生成的对象加进数组
    _allTopic = @[tone, ttwo, tthree,tfour,tfive,tsix,tseven,teight];
}
#pragma mark 设置数据源sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark 设置数据源row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allTopic.count; //根据数组长度来设定row的大小
}

#pragma mark 生成cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"cellOne";
    UITableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:ID];//生成缓存池，用来存放cell
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }//如果池中没有cell，重新生成一个cell

    TopicBurn *topic = _allTopic[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"第%d题       %@ %@ %@",indexPath.row+1,topic.numberOne,topic.operators,topic.numberTwo];
    cell.detailTextLabel.text=@"welcome to use Jinbin Xie app";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor=[UIColor colorWithRed:0 green:168 blue:255 alpha:1];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.detailTextLabel.textColor=[UIColor whiteColor];
    [tableView setSeparatorColor:[UIColor whiteColor]];
    cell.selectedBackgroundView.backgroundColor=[UIColor whiteColor];
    return cell;
}
#pragma mark 设置cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}
#pragma mark 点击cell时响应
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    TopicBurn *topics=_allTopic[indexPath.row];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请输入答案" message:@"(只用输入小数点前整数)"  delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"提交", nil];
    alert.alertViewStyle=UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    alert.tag=indexPath.row;
    [alert show];
}
#pragma mark 点击alertview的button时
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) return;
    if (alertView.tag!=(_allTopic.count-1)) {
        NSString *text = [alertView textFieldAtIndex:0].text;
        TopicBurn *topic = _allTopic[alertView.tag];
        int result;
        
        if ([topic.operators isEqualToString:@"+"]) {
            result = [topic.numberOne intValue]+[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade++;
            }else{
                grade--;
            }
        }
        
        if ([topic.operators isEqualToString:@"-"]) {
            result = [topic.numberOne intValue]-[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade=grade+2;
            }else{
                grade = grade-2;
            }
        }
        
        if ([topic.operators isEqualToString:@"*"]) {
            result = [topic.numberOne intValue]*[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+3;
            }else{
                grade = grade-3;
            }
        }
        
        if ([topic.operators isEqualToString:@"/"]) {
            result = [topic.numberOne intValue]+[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+4;
            }else{
                grade = grade-4;
            }
        }

        if ([topic.operators isEqualToString:@"&"]) {
            result = [topic.numberOne intValue]&[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+5;
            }else{
                grade = grade-5;
            }
        }

        if ([topic.operators isEqualToString:@"|"]) {
            result = [topic.numberOne intValue]|[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+6;
            }else{
                grade = grade-6;
            }
        }

        if ([topic.operators isEqualToString:@"⊕"]) {
            result = [topic.numberOne intValue]^[topic.numberTwo intValue];
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+7;
            }else{
                grade = grade-7;
            }
        }
        if ([topic.operators isEqualToString:@"⊙"]) {
            result = ~([topic.numberOne intValue]^[topic.numberTwo intValue]);
            if ([text isEqualToString:[NSString stringWithFormat:@"%i",result]]) {
                grade = grade+8;
            }else{
                grade = grade-8;
            }
        }

    } else {
        TopicBurn *topics = _allTopic[(_allTopic.count-1)];
        topics.numberOne=@"Your last";
        topics.operators=@"grade is";
        topics.numberTwo=[NSString stringWithFormat:@"%i ",grade];
    }
    [_tabView reloadData];
}
#pragma mark 刷新数据方法
- (IBAction)refreshButton:(id)sender {
}
@end

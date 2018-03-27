//
//  ViewController.m
//  tst
//
//  Created by Jermy on 2018/3/22.
//  Copyright © 2018年 Jermy. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()
@end

@implementation ViewController
{
    UILabel *label1;
    UILabel *label2;
    CGSize size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSString *text = @"人之初 性本善 性相近 习相远 苟不教 性乃迁 要知道 贵以专 昔孟母 择邻处 子不学 断机杼 窦燕山 有一方 教五子 名俱扬";
    
    NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    NSInteger viewH = 60;
    NSInteger viewW = screenWidth;
    NSInteger viewY = (screenHeight - viewH) * 0.5;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.frame = CGRectMake(0, viewY, viewW, viewH);
    [self.view addSubview:bgView];
   
    NSDictionary *att = @{NSFontAttributeName : [UIFont systemFontOfSize:18]};
    size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesFontLeading attributes:att context:nil].size;
    
    label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, 10, size.width, 40);
    label1.text = text;
    label1.textColor = [UIColor whiteColor];
    [label1 setFont:[UIFont systemFontOfSize:18]];
    [bgView addSubview:label1];
    
    label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(size.width + 50, 10, size.width, 40);
    label2.text = text;
    label2.textColor = [UIColor whiteColor];
    [label2 setFont:[UIFont systemFontOfSize:18]];
    [bgView addSubview:label2];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(labelMove)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)labelMove
{
    CGAffineTransform transform1 = label1.transform;
    if (fabsf(transform1.tx) >= size.width) {
        transform1 = CGAffineTransformIdentity;
    }
    label1.transform = CGAffineTransformTranslate(transform1, -1, 0);
    
    CGAffineTransform transform2 = label2.transform;
    if (fabsf(transform2.tx) >= size.width + 60) {
        transform2 = CGAffineTransformIdentity;
    }
    label2.transform = CGAffineTransformTranslate(transform2, -1, 0);
}

@end

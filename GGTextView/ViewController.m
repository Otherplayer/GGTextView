//
//  ViewController.m
//  GGTextView
//
//  Created by __无邪_ on 15/9/9.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GGTextView.h"
@interface ViewController ()<UITextViewDelegate>
@property (nonatomic, strong)GGTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.textView = [[GGTextView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 200)];
    [self.textView setMaxNumberLimited:10];
    [self.textView setFont:[UIFont systemFontOfSize:14]];
    [self.textView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [self.textView setPlaceholder:@"输入点什么吧"];
    [self.view addSubview:self.textView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

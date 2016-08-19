//
//  ViewController.m
//  layout
//
//  Created by qianjn on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"
#import "BoxView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    BoxView *box = [[BoxView alloc] init];
    [self.view addSubview:box];
}



@end

//
//  CADataViewController.m
//  油茶练手
//
//  Created by kys-20 on 2017/12/9.
//  Copyright © 2017年 kys-20. All rights reserved.
//

#import "CADataViewController.h"

@interface CADataViewController ()

@end

@implementation CADataViewController
//view层的代码全部封装到这个UIView类中去
- (CADataVIew *)dataView
{
    if (!_dataView)
    {
        _dataView = [[CADataVIew alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) andTitle:self.title];
    }
    return _dataView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"星天牛";
    //C调用View只需要一行代码 实现VC的解耦
    [self.view addSubview:self.dataView];
   
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

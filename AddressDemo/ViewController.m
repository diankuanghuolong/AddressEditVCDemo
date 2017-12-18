//
//  ViewController.m
//  AddressDemo
//
//  Created by Ios_Developer on 2017/12/18.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "ViewController.h"
#import "AddressVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"地址管理";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 30)];
    btn.layer.cornerRadius = 7;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"地址管理" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(gotoAddressVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)gotoAddressVC:(id)sender
{
    NSLog(@"进入地址管理页面");
    AddressVC *addressVC = [AddressVC new];
    [self.navigationController pushViewController:addressVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

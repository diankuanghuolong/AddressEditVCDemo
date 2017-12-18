//
//  AddressVC.m
//  AddressDemo
//
//  Created by Ios_Developer on 2017/12/18.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "AddressVC.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface AddressVC ()

@property(nonatomic,strong)UIView *addressView;
@property(nonatomic,strong)UIView *bgView;
@end

@implementation AddressVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    self.bgView = view;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showAddressView:)];
    [view addGestureRecognizer:tap];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH - 20, 40)];
    l.text = @"点我选择地址";
    l.textAlignment = NSTextAlignmentCenter;
    l.textColor = [UIColor blackColor];
    l.font = [UIFont systemFontOfSize:17];
    [view addSubview:l];
    
}

#pragma mark  ===== action  =====
-(CATransform3D)transform
{
    CATransform3D t = CATransform3DIdentity;
    t.m34 = 1.0/-900;  //默认 0/(D)　D无穷大，D越下，透视效果越明显
    t = CATransform3DScale(t, 1, 1, 1);
    t = CATransform3DRotate(t, 15.0*M_PI/180.0, 1, 0, 0);
    
    return t;
}
-(void)showAddressView:(UITapGestureRecognizer *)tap{
    
    [UIView animateWithDuration:0.25f animations:^{
        
        self.bgView.layer.transform = [self transform];
        
        UIView * addressV = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.navigationController.view addSubview:addressV];
        _addressView = addressV;
        
        UIView *pickerView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - SCREEN_HEIGHT + 200, SCREEN_WIDTH, SCREEN_HEIGHT - 200)];
        pickerView.backgroundColor = [UIColor whiteColor];
        [addressV addSubview:pickerView];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenAddressView:)];
        [addressV addGestureRecognizer:tap];
        
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH - 20, 40)];
        l.text = @"点我返回原界面";
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = [UIColor blackColor];
        l.font = [UIFont systemFontOfSize:17];
        [pickerView addSubview:l];
        
        
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.25f animations:^{
            
            self.bgView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
            _addressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            
        } completion:^(BOOL finished) {
            
            _addressView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        }];
        
    }];
    
}
- (void)hiddenAddressView:(UITapGestureRecognizer *)tap{
    
    [UIView animateWithDuration:0.25f animations:^{
        
        _addressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.bgView.layer.transform = [self transform];
        
    } completion:^(BOOL finished) {
        
        [self.addressView removeFromSuperview];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.bgView.transform = CGAffineTransformMakeScale(1, 1);
            
        }];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

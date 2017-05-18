//
//  ZYBaseViewController.m
//  ZYSliderViewController
//
//  Created by jing on 17/5/18.
//  Copyright © 2017年 zY. All rights reserved.
//

#import "ZYBaseViewController.h"

@interface ZYBaseViewController ()
@property float oldHeight;

@end

@implementation ZYBaseViewController
-(instancetype)init
{
    if (self=[super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFrame) name:@"变化" object:nil];
    }
    return self;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)changeFrame{
    CGRect frame = self.view.frame;
    self.view.clipsToBounds = YES;
    CGRect statusBarRect = [[UIApplication sharedApplication] statusBarFrame];
    if (statusBarRect.size.height == 40) {
        frame.size.height = self.oldHeight - 20 - frame.origin.y;
    }
    if (statusBarRect.size.height == 20){
        frame.origin.y = 0;
        frame.size.height = self.oldHeight;
    }
    self.view.frame = frame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.oldHeight = [UIScreen mainScreen].bounds.size.height;
    // Do any additional setup after loading the view.
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

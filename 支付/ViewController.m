//
//  ViewController.m
//  支付
//
//  Created by apple on 15/12/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *name = @"2.gif";
    NSString *paa = [[NSBundle mainBundle]bundlePath];
    NSString *filePath = [[NSBundle bundleWithPath:paa]pathForResource:name ofType:nil];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    
    UIImageView *bigImageView = [[UIImageView alloc]init];
//    bigImageView.backgroundColor = [UIColor clearColor];
    bigImageView.frame = self.view.bounds;
    
    bigImageView.image = [UIImage sd_animatedGIFWithData:imageData];
    NSLog(@"%@",bigImageView.image);
    
    [self.view addSubview:bigImageView];
    
    [self.view bringSubviewToFront:bigImageView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(230, 350, 100, 100);
    [btn setTitle:@"支付宝" forState:normal];
    [btn addTarget:self action:@selector(btnActon:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 50;
    btn.clipsToBounds = YES;
    btn.alpha = .7;
    [btn setTitleColor:[UIColor blackColor] forState:normal];
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    
}
- (void)btnActon:(UIButton *)btn
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.alipay.com/"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

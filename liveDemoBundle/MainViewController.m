//
//  MainViewController.m
//  liveDemoBundle
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MainViewController.h"
#import "LeftMainViewController.h"
#import "MidMainViewController.h"
#import "RightMainViewController.h"

@interface MainViewController ()

@property(nonatomic,strong) UINavigationController *leftNav;
@property(nonatomic,strong) UINavigationController *midNav;
@property(nonatomic,strong) UINavigationController *rightNav;

@end

@implementation MainViewController

- (UINavigationController *)leftNav{
    if (!_leftNav) {
        LeftMainViewController *LMVC = [[LeftMainViewController alloc]init];
        LMVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"demo"] tag:1];
        _leftNav = [[UINavigationController alloc]initWithRootViewController:LMVC];
      //  [_leftNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:20] forKey:NSFontAttributeName]];
    }
    return _leftNav;
}

- (UINavigationController *)midNav{
    if (!_midNav) {
        MidMainViewController *MMVC = [[MidMainViewController alloc]init];
        
        MMVC.tabBarItem =
        //[[UITabBarItem alloc]initWithTitle:@"" image:[[UIImage imageNamed:@"主页"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"主页_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"主页"] tag:2];
        
        _midNav = [[UINavigationController alloc]initWithRootViewController:MMVC];
        
      //  [_midNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:20] forKey:NSFontAttributeName]];
    }
    return _midNav;
}

- (UINavigationController *)rightNav{
    if (!_rightNav) {
        RightMainViewController *RMVC = [[RightMainViewController alloc]init];
        RMVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage imageNamed:@"设置"] tag:3];
        _rightNav = [[UINavigationController alloc]initWithRootViewController:RMVC];
      //  [_rightNav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:20] forKey:NSFontAttributeName]];
    }
    return _rightNav;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        [self setViewControllers:[NSArray arrayWithObjects:self.leftNav,self.midNav,self.rightNav,nil] animated:YES];
       // self.selectedIndex = 1;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  AppDelegate.m
//  liveDemoBundle
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "AppDelegate.h"
//#import "MainViewController.h"
#import "WelcomePageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
   // MainViewController *main = [[MainViewController alloc]init];
   // main.selectedIndex = 1;
 //   self.window.rootViewController = main;
    WelcomePageController *vc = [[WelcomePageController alloc]init];
    self.window.rootViewController = vc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self setAppearance];
   // [self guidePages];
    [self.window makeKeyAndVisible];
    
    return YES;
}/*
- (void)guidePages
{
    //数据源
    NSArray *imageArray = @[ @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg" ];
    
    //  初始化方法1
    welcomePage *welcome = [[welcomePage alloc] init];
    welcome.images = imageArray;
    __weak typeof(welcomePage) *weakView = welcome;
    //__weak typeof(self) *weakSelf = *self;
    welcome.buttonAction = ^{
        [UIView animateWithDuration:2.0f
                         animations:^{
                             weakView.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [weakView removeFromSuperview];
                             MainViewController *main = [[MainViewController alloc]init];
                             // main.selectedIndex = 1;
                             self.window.rootViewController = main;
                         }];
    };
    
    //  初始化方法2
    //    MZGuidePagesController *welcome = [[MZGuidePagesController alloc]
    //    initWithImageDatas:imageArray
    //                                                                            completion:^{
    //                                                                              NSLog(@"click!");
    //
    //要在makeKeyAndVisible之后调用才有效
    [self.window addSubview:welcome];
    NSLog(@"what?");
    
}*/
- (void)setAppearance{
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    //tabbar
    [[UITabBar appearance] setTranslucent:NO];
        //颜色
    [[UITabBar appearance]setBarTintColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]];
        //点击后颜色
    [[UITabBar appearance]setTintColor:[UIColor colorWithRed:86.0/255.0 green:171.0/255.0 blue:228.0/255.0 alpha:1.0]];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

//
//  WelcomePageController.m
//  liveDemoBundle
//
//  Created by admin on 16/8/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "WelcomePageController.h"
#import "welcomePage.h"
#import "MainViewController.h"

@implementation WelcomePageController

- (void)loadView{
    //self.view = [[welcomePage alloc]init];
    welcomePage *view = [[welcomePage alloc]init];
    NSArray *images = @[@"welcome1.jpg",@"welcome2.jpg",@"welcome3.jpg",@"welcome4.jpg"];
    [view setImages:images];
    __weak typeof(welcomePage) *weakView = view;
    weakView.buttonAction = ^{
      [UIView animateWithDuration:2.0 animations:^{
          weakView.alpha = 0.0;
      } completion:^(BOOL finished) {
         // NSLog(@"JIN RU ");
          MainViewController *main = [[MainViewController alloc]init];
          self.view.window.rootViewController = main;
         
      }];
    };
    self.view = view;
}



@end

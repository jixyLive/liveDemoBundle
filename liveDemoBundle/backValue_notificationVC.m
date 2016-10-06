//
//  backValue_notificationVC.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValue_notificationVC.h"
#import "backValueMainView.h"
#import "backValue_notificationVC2.h"

@interface backValue_notificationVC ()
@property(nonatomic,strong)UILabel *text;
@property(nonatomic,strong)UIButton *next;
@end

@implementation backValue_notificationVC

- (void)loadView{
    backValueMainView *view = [[backValueMainView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = view;
    self.text = view.text;
    self.next = view.next;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.next addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveValue:) name:@"backValue_notifaication" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
   // [super dealloc];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"backValue_notifaication" object:nil];
   // NSLog(@"back_value_notification delloc");
}

- (void)go{
    backValue_notificationVC2 *vc = [[backValue_notificationVC2 alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)receiveValue:(NSNotification*)back_value{
    NSString *str = [back_value.userInfo objectForKey:@"value"];
    [self.text setText:str];
}
@end

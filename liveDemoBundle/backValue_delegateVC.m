//
//  backValue_delegateVC.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValue_delegateVC.h"
#import "backValueMainView.h"
#import "backValue_delegateVC2.h"

@interface backValue_delegateVC ()<backValueDelegate>

@property(nonatomic,strong)UILabel *text;
@property(nonatomic,strong)UIButton *next;

@end

@implementation backValue_delegateVC

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)go{
    backValue_delegateVC2 *vc = [[backValue_delegateVC2 alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark backValue 
- (void)sendValue:(NSString *)str{
    [self.text setText:str];
}

@end

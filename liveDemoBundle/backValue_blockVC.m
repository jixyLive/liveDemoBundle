//
//  backValue_blockVC.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValue_blockVC.h"
#import "backValueMainView.h"
#import "backValue_blockVC2.h"

@interface backValue_blockVC ()
@property(nonatomic,strong)UILabel *text;
@property(nonatomic,strong)UIButton *next;

@end

@implementation backValue_blockVC

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
    backValue_blockVC2 *vc = [[backValue_blockVC2 alloc]init];
    vc.block = ^(NSString * str){
        [self.text setText:str];
    };
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end

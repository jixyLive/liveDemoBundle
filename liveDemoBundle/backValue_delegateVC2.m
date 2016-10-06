//
//  backValue_delegateVC2.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValue_delegateVC2.h"
#import "backValueSencondaryView.h"

@interface backValue_delegateVC2 ()

@property(nonatomic,strong)UIButton *goBack;
@property(nonatomic,strong)UITextField *textField;

@end

@implementation backValue_delegateVC2

- (void)loadView{
    backValueSencondaryView *view = [[backValueSencondaryView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = view;
    self.textField = view.textField;
    self.goBack = view.goBack;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.goBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.hidesBackButton = YES;//隐藏返回按钮
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(sendValue:)]) {
        [self.delegate sendValue:self.textField.text];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end

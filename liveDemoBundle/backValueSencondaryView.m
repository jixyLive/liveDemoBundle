//
//  backValueSencondaryView.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValueSencondaryView.h"

@implementation backValueSencondaryView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textField];
        [self addSubview:self.goBack];
        [self addGesture];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:80]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.9 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.08 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.textField attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.goBack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textField attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.goBack attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    }
    return self;
}

- (UITextField  *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.backgroundColor = [UIColor lightGrayColor];
        //_textField.text = @"回传数据content";
        [_textField setFont:[UIFont systemFontOfSize:20]];
        _textField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textField;
}

- (UIButton *)goBack{
    if(!_goBack){
        _goBack = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_goBack setTitle:@" GO BACK " forState:UIControlStateNormal];
        [_goBack setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _goBack.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _goBack;
}

- (void)addGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyborad)];
    [self addGestureRecognizer:tap];
}

- (void)hideKeyborad{
    [self.textField resignFirstResponder];
}
@end

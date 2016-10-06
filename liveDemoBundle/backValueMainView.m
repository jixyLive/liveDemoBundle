//
//  backValueMainView.m
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import "backValueMainView.h"



@implementation backValueMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.text];
        [self addSubview:self.next];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:60]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0]];
        
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.next attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.text attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.next attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        
    }
    return self;
}

- (UILabel *)text{
    if (!_text) {
        _text = [[UILabel alloc]init];
        self.backgroundColor = [UIColor lightTextColor];
        _text.text = @"回传数据content";
        [_text setTextAlignment:NSTextAlignmentCenter];
        
        _text.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _text;
}

- (UIButton *)next{
    if(!_next){
        _next = [UIButton buttonWithType:UIButtonTypeCustom];
        _next.backgroundColor = [UIColor colorWithRed:77.0/255.0 green:182.0/255.0 blue:230.0/255.0 alpha:1.0];
        _next.layer.cornerRadius = 10;
        [_next setTitle:@" G O " forState:UIControlStateNormal];
        [_next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
      //  [_next setTintColor:[UIColor blackColor]];
        _next.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _next;
}

@end

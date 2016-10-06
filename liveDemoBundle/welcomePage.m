//
//  welcomePage.m
//  liveDemoBundle
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "welcomePage.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface welcomePage ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIButton *enterBtn;
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIPageControl *pageControl;

@end

@implementation welcomePage

- (instancetype)init{
    return [self initWithImageDatas:nil completion:nil];
}

- (instancetype)initWithImageDatas:(NSArray *)images completion:(void(^)(void))buttonAction{
    self = [super initWithFrame:[[UIScreen mainScreen]bounds]];
    if (self) {
        [self initView];
        [self setImages:images];
        _buttonAction = buttonAction;
    }
    return self;
}

- (void)setImages:(NSArray *)images{
    _images = images;
    [self initContentView];
}

- (void)initView{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
   
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.delegate = self;
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 30, SCREEN_WIDTH, 10)];
    _pageControl.hidesForSinglePage = YES;
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageControl];
    
    _enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
}
- (void)initContentView{
    if (_images.count) {
        _pageControl.numberOfPages = _images.count;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*_images.count, SCREEN_HEIGHT);
        for (int i = 0; i < _images.count; i++)
        {
            NSString *imageName = _images[i];
            UIImageView *imgView =
            [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
            imgView.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [self.scrollView addSubview:imgView];
            
            if (i == _images.count - 1)
            {
                _enterBtn.frame =
                CGRectMake(SCREEN_WIDTH / 2 - 70, SCREEN_HEIGHT - 70, 140, 35);
                _enterBtn.layer.cornerRadius = 5;
                _enterBtn.layer.masksToBounds = YES;
                [_enterBtn setTitle:@"马上 进  入" forState:UIControlStateNormal];
                _enterBtn.tintColor = [UIColor whiteColor];
                _enterBtn.backgroundColor = [UIColor redColor];
                [_enterBtn addTarget:self
                                  action:@selector(enterButtonClick)
                        forControlEvents:UIControlEventTouchUpInside];
                [imgView addSubview:_enterBtn];
                //设置可以响应交互，UIImageView的默认值为NO
                imgView.userInteractionEnabled = YES;
            }
        }
        
    }
    
}

#pragma mark function

- (void)enterButtonClick{
    if (_buttonAction) {
        _buttonAction();
    }
}

#pragma mark UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = (_scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
}

@end

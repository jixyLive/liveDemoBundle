//
//  backValue_delegateVC2.h
//  TTQ_Students
//
//  Created by mizi on 16/7/9.
//  Copyright © 2016年 csu.changsha.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol backValueDelegate <NSObject>

- (void)sendValue:(NSString *)str;

@end

@interface backValue_delegateVC2 : UIViewController

@property (nonatomic,weak)id<backValueDelegate> delegate;

@end

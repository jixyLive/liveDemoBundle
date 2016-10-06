//
//  welcomePage.h
//  liveDemoBundle
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface welcomePage : UIView

@property (nonatomic,strong) NSArray *images;
@property (nonatomic,copy) void (^buttonAction)();

@end

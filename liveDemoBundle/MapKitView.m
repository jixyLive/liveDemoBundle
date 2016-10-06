//
//  MapKitView.m
//  liveDemoBundle
//
//  Created by admin on 16/7/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MapKitView.h"

@implementation MapKitView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.map];
    }
    return self;
}

- (MKMapView *)map{
    if (!_map) {
        _map = [[MKMapView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        [_map setMapType:MKMapTypeStandard];
        //跟踪位置 前进方向
        [_map setUserTrackingMode:MKUserTrackingModeFollowWithHeading];
    }
    return _map;
}

@end

//
//  MapKitCalloutAnnotationView.h
//  liveDemoBundle

//  弹出详情 大头针视图

//  Created by admin on 16/8/14.
//  Copyright © 2016年 admin. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "MapKitCalloutAnnotation.h"

@interface MapKitCalloutAnnotationView : MKAnnotationView

@property(nonatomic,strong) MapKitCalloutAnnotation *annotation;
#pragma mark 从缓存取出标注视图
+(instancetype)calloutViewWithMapView:(MKMapView *)mapView;

@end

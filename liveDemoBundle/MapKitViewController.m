//
//  MapKitViewController.m
//  liveDemoBundle
//   !!!!!!!!!!!!!!!!!! 为自定义详情视图关键代码，如采用默认annotationView可注释掉该部分代码
//
//  Created by admin on 16/7/21.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MapKitViewController.h"
#import "MapKitView.h"
#import <CoreLocation/CoreLocation.h>
#import "MapKitAnnotation.h"

#import "MapKitCalloutAnnotation.h"
#import "MapKitCalloutAnnotationView.h"

@interface MapKitViewController ()<MKMapViewDelegate>{
    CLLocationManager *locationManager;
    MKMapView *map;
}

@property (nonatomic,strong)MKMapView * map;

@end

@implementation MapKitViewController

- (void)loadView{
    
    MapKitView *view = [[MapKitView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.view = view ;
    map = view.map;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    locationManager = [[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus]!=kCLAuthorizationStatusAuthorizedWhenInUse) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    map.delegate = self;
    //添加大头针
    [self addAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addAnnotation{
    CLLocationCoordinate2D location1=CLLocationCoordinate2DMake(28.20057, 113.019969);
    
    MapKitAnnotation *annotation1=[[MapKitAnnotation alloc]init];
    annotation1.title=@"Station";
    annotation1.subtitle=@"ChangSha火车站";
    annotation1.image = [UIImage imageNamed:@"大头针"];
    annotation1.coordinate=location1;
    //   !!!!!!!!!!!!!!!!!!
    annotation1.icon = [UIImage imageNamed:@"icon_cafe"];
    annotation1.detail = @"1. detail";
    annotation1.rate=[UIImage imageNamed:@"icon_Movie_Star_rating"];

    [map addAnnotation:annotation1];
    
    
    CLLocationCoordinate2D location2=CLLocationCoordinate2DMake(28.170789, 112.931330);
    MapKitAnnotation *annotation2=[[MapKitAnnotation alloc]init];
    annotation2.title=@"School";
    annotation2.subtitle=@"中南大学 计算机楼";
    annotation2.image = [UIImage imageNamed:@"大头针"];
    annotation2.coordinate=location2;
    //   !!!!!!!!!!!!!!!!!!
    annotation2.icon = [UIImage imageNamed:@"icon_cafe"];
    annotation2.detail = @"2. detail";
    annotation2.rate=[UIImage imageNamed:@"icon_Movie_Star_rating"];
    
    [map addAnnotation:annotation2];
}

#pragma mark MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
   // NSLog(@"delegate update :%f",userLocation.location.coordinate.longitude);
    //设置地图显示范围(如果不进行区域设置会自动显示区域范围并指定当前用户位置为地图中心点)
        //MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
        //MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.location.coordinate, span);
        //[mapView setRegion:region animated:true];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
   if ([annotation isKindOfClass:[MapKitAnnotation class]]) {
        NSLog(@"ann");
        static NSString *key = @"MapKitAnnotation";
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:key];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key];
           //   !!!!!!!!!!!!!!!!!!
            annotationView.canShowCallout = YES;//允许点击交互
            
            annotationView.calloutOffset = CGPointMake(0, 1);
            //左侧图片
            annotationView.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"大头针 (1)"]];
            
        }
        //修改大头针视图
        //重新设置此类大头针视图的大头针模型(因为有可能是从缓存池中取出来的，位置是放到缓存池时的位置)
        annotationView.annotation = annotation;
        annotationView.image = ((MapKitAnnotation *)annotation).image;
        
        return annotationView;
    }else if([annotation isKindOfClass:[MapKitCalloutAnnotation class]]){
        NSLog(@"call");
        //对于作为弹出详情视图的自定义大头针视图无弹出交互功能（canShowCallout=false，这是默认值），在其中可以自由添加其他视图（因为它本身继承于UIView）
        MapKitCalloutAnnotationView *calloutView=[MapKitCalloutAnnotationView calloutViewWithMapView:mapView];
        calloutView.annotation=annotation;
        return calloutView;
    }  else {
        return nil;
    }
}

#pragma mark 选中大头针时触发
//点击一般的大头针KCAnnotation时添加一个大头针作为所点大头针的弹出详情视图
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    MapKitAnnotation *annotation=view.annotation;
    if ([view.annotation isKindOfClass:[MapKitAnnotation class]]) {
        //点击一个大头针时移除其他弹出详情视图
        //[self removeCustomAnnotation];
        //添加详情大头针，渲染此大头针视图时将此模型对象赋值给自定义大头针视图完成自动布局
        MapKitCalloutAnnotation *annotation1=[[MapKitCalloutAnnotation alloc]init];
        annotation1.icon=annotation.icon;
        annotation1.detail=annotation.detail;
        annotation1.rate=annotation.rate;
        annotation1.coordinate=view.annotation.coordinate;
        [mapView addAnnotation:annotation1];
        
    }
}

#pragma mark 取消选中时触发
-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
    [self removeCustomAnnotation];
}

#pragma mark 移除所用自定义大头针
-(void)removeCustomAnnotation{
    [map.annotations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MapKitCalloutAnnotation class]]) {
            [map removeAnnotation:obj];
        }
    }];
    /*
    for(id obj in map.annotations){
        if ([obj isKindOfClass:[MapKitCalloutAnnotation class]]) {
            [map removeAnnotation:obj];
        }
    }*/
}

@end

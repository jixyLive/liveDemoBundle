//
//  MapKitCalloutAnnotationView.m
//  liveDemoBundle
//
//  Created by admin on 16/8/14.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "MapKitCalloutAnnotationView.h"

#define spacing 5
#define kViewOffset 80

@interface MapKitCalloutAnnotationView (){
    UIView *backGround;
    UIImageView *icon;
    UILabel *detailLabel;
    UIImageView *rateView;
}

@end

@implementation MapKitCalloutAnnotationView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self addUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect )frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addUI];
    }
    return self;
}

- (void)addUI{
    backGround = [[UIView alloc]init];
    backGround.backgroundColor = [UIColor blueColor];
    
    icon = [[UIImageView alloc]init];
    
    detailLabel = [[UILabel alloc]init];
    detailLabel.font = [UIFont systemFontOfSize:12];
    
    rateView = [[UIImageView alloc]init];
    
    [self addSubview:backGround];
    [self addSubview:icon];
    [self addSubview:detailLabel];
    [self addSubview:rateView];
}

+ (instancetype)calloutViewWithMapView:(MKMapView *)mapView{
    static NSString *calloutKey=@"calloutKey1";
    MapKitCalloutAnnotationView *calloutView=(MapKitCalloutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:calloutKey];
    if (!calloutView) {
        calloutView=[[MapKitCalloutAnnotationView alloc]init];
    }
    return calloutView;
}

- (void)setAnnotation:(MapKitCalloutAnnotation *)annotation{
    [super setAnnotation:annotation];
    icon.image = annotation.icon;
    icon.frame = CGRectMake(spacing, spacing, annotation.icon.size.width, annotation.icon.size.height);
    
    detailLabel.text = annotation.detail;
    float detailWidth=150.0;
    CGSize detailSize= [annotation.detail boundingRectWithSize:CGSizeMake(detailWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size;
    float detailX=CGRectGetMaxX(icon.frame)+spacing;
    detailLabel.frame=CGRectMake(detailX, spacing, detailSize.width, detailSize.height);
    rateView.image=annotation.rate;
    rateView.frame=CGRectMake(detailX, CGRectGetMaxY(detailLabel.frame)+spacing, annotation.rate.size.width, annotation.rate.size.height);
    
    float backgroundWidth=CGRectGetMaxX(detailLabel.frame)+spacing;
    float backgroundHeight=icon.frame.size.height+2*spacing;
    backGround.frame=CGRectMake(0, 0, backgroundWidth, backgroundHeight);
    self.bounds=CGRectMake(0, 0, backgroundWidth, backgroundHeight+kViewOffset);

}

@end

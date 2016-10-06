//
//  LeftMainViewController.m
//  liveDemoBundle
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "LeftMainViewController.h"
#import "backValue_blockVC.h"
#import "backValue_delegateVC.h"
#import "backValue_notificationVC.h"

#import "MapKitViewController.h"
#import "CoreLocationViewController.h"

@interface LeftMainViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *tableData;
@property (nonatomic,assign) CGFloat sectionHeight;
@end

@implementation LeftMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"demo";
    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    
    self.sectionHeight = 60;
    self.tableData = [NSArray arrayWithObjects:@[@"backvalue_block",@"backvalue_delegate",@"backvalue_notification"], @[@"MapKit",@"CoreLocation"], nil];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"demo cell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray * sectionArr = [self.tableData objectAtIndex:section];
    return sectionArr.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]init];
    header.backgroundColor = [UIColor lightGrayColor];
    UILabel *textLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, self.sectionHeight)];
    textLab.text = [NSString stringWithFormat:@"\tSection : %ld",section+1];
    [textLab setTextColor:[UIColor redColor]];
    
    [header addSubview:textLab];
   // textLab.frame = header.frame;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  self.sectionHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demo cell" forIndexPath:indexPath];
    // Configure the cell...
    
    [cell.textLabel setText:[NSString stringWithFormat:@"\t %ld -%ld -> %@",indexPath.section+1,indexPath.row+1,[[self.tableData objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]]];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                backValue_blockVC *vc = [[backValue_blockVC alloc] init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                //}
                break;
                }
            case 1:{
                backValue_delegateVC *vc = [[backValue_delegateVC alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case 2:{
                backValue_notificationVC *vc = [[backValue_notificationVC alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
        
    } else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {
                MapKitViewController *vc = [[MapKitViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                
            }
                break;
            case 1:{
                CoreLocationViewController *vc = [[CoreLocationViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    }
    
}

#pragma mark scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
}

@end

//
//  ViewController.m
//  dataEmpty
//
//  Created by apple on 2018/6/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "emptyView.h"
#import "MBProgressHUD+MJ.h"
#import "MBProgressHUD+NHAdd.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    emptyView *emp = [emptyView emptyViewiconName:@"empty_network@2x.png" Title:@"暂无数据" detailTitle:@"暂无数据暂无数据暂无数据" actionButtonTitle:nil actionBlock:nil];
    [self.view addSubview:emp];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [emp hiddenEmptyView];
    });
    
//    [MBProgressHUD showError:@"err"];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD showMessage:@"sur"];
//
//    });
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//       [MBProgressHUD showSuccess:@"weq"];
//    });
    
    [MBProgressHUD showTitleToView:self.view postion:NHHUDPostionBottom title:@"weq"];


}


/*
 
 NSInteger row = indexPath.row;
 switch (row) {
 case 0:
 [MBProgressHUD showTitleToView:self.view postion:NHHUDPostionBottom title:_listTitle[row]];
 break;
 
 case 1:
 [MBProgressHUD showTitleToView:self.navigationController.view
 postion:NHHUDPostionTop
 contentStyle:NHHUDContentDefaultStyle
 title:_listTitle[row]];
 break;
 
 case 2:
 [MBProgressHUD showOnlyLoadToView:self.view];
 break;
 
 case 3:
 [MBProgressHUD showLoadToView:self.view title:_listTitle[row]];
 break;
 
 case 4: {
 [MBProgressHUD showTitleToView:self.view contentStyle:NHHUDContentDefaultStyle title:_listTitle[row] afterDelay:10];
 }
 break;
 
 case 5: {
 [MBProgressHUD showOnlyTextToView:self.view title:@"the is title" detail:@"the is detail,the is detail,the is detail"];
 }
 break;
 
 case 6: {
 [MBProgressHUD showDownToView:self.view progressStyle:NHHUDProgressDeterminate title:_listTitle[row] progress:^(MBProgressHUD *hud) {
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 [self doSomeWorkWithProgress:hud];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 }];
 }
 break;
 
 case 7: {
 [MBProgressHUD showDownToView:self.view progressStyle:NHHUDProgressDeterminateHorizontalBar title:_listTitle[row] progress:^(MBProgressHUD *hud) {
 hud.allContentColors([UIColor yellowColor]);
 hud.progressColor([UIColor whiteColor]);
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 [self doSomeWorkWithProgress:hud];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 }];
 }
 break;
 
 case 8: {
 [MBProgressHUD showDownToView:self.view progressStyle:NHHUDProgressDeterminate title:_listTitle[row] cancelTitle:@"cancel" progress:^(MBProgressHUD *hud) {
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 [self doSomeWorkWithProgress:hud];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 } cancelation:^(MBProgressHUD *hud) {
 [self cancelDown:hud];
 }];
 }
 break;
 
 case 9: {
 [MBProgressHUD showDownToView:self.view progressStyle:NHHUDProgressDeterminateHorizontalBar title:_listTitle[row] cancelTitle:@"cancel" progress:^(MBProgressHUD *hud) {
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 [self doSomeWorkWithProgress:hud];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 } cancelation:^(MBProgressHUD *hud) {
 [self cancelDown:hud];
 }];
 }
 break;
 
 case 10: {
 [MBProgressHUD showCustomView:[[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
 toView:self.view
 title:@"Done"];
 }
 break;
 
 case 11: {
 [MBProgressHUD showModelSwitchToView:self.view title:@"Preparing..." configHud:^(MBProgressHUD *hud) {
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 // Do something useful in the background and update the HUD periodically.
 [self doSomeWorkWithMixedProgress:hud];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 }];
 }
 break;
 
 case 12: {
 MBProgressHUD *hud = [MBProgressHUD showLoadToView:self.navigationController.view
 backgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]
 title:_listTitle[row]];
 [self autoHiddenHud:hud];
 }
 break;
 
 case 13: {
 MBProgressHUD *hud = [MBProgressHUD showLoadToView:self.view
 contentColor:[UIColor redColor]
 title:_listTitle[row]];
 [self autoHiddenHud:hud];
 }
 break;
 
 case 14: {
 [MBProgressHUD showLoadToView:self.view
 titleColor:[UIColor lightGrayColor]
 bezelViewColor:[UIColor purpleColor]
 backgroundColor:[[UIColor yellowColor] colorWithAlphaComponent:0.5]
 title:_listTitle[row]];
 }
 break;
 
 case 15: {
 [MBProgressHUD showModelSwitchToView:self.view title:@"Preparing..." configHud:^(MBProgressHUD *hud) {
 [self doSomeNetworkWorkWithProgress];
 }];
 }
 break;
 
 case 16: {
 NSProgress *progressObject = [NSProgress progressWithTotalUnitCount:100];
 [MBProgressHUD  showDownWithNSProgress:progressObject toView:self.view title:_listTitle[16] configHud:^(MBProgressHUD *hud) {
 dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
 [self doSomeWorkWithProgressObject:hud.progressObject];
 dispatch_async(dispatch_get_main_queue(), ^{
 [hud hideAnimated:YES];
 });
 });
 }];
 [self doSomeNetworkWorkWithProgress];
 }
 break;
 
 case 17:{
 [MBProgressHUD showDetailToView:self.view postion:NHHUDPostionBottom title:@"title" detail:_listTitle[row]];
 }
 break;
 
 case 18:{
 [MBProgressHUD createHudToView:self.navigationController.view title:_listTitle[row] configHud:^(MBProgressHUD *hud) {
 hud.title(@"new title");
 hud.contentColor = [UIColor yellowColor];
 hud.titleColor(UIColor.redColor);
 hud.bezelBackgroundColor(UIColor.greenColor);
 hud.hudBackgroundColor([[UIColor blueColor] colorWithAlphaComponent:0.2]);
 }];
 }
 break;
 default:
 break;
 }

 
 
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

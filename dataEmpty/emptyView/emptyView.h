//
//  emptyView.h
//  dataEmpty
//
//  Created by apple on 2018/6/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    enptyDataType ,
    enptyNetErrorType,
} EmptyType;

typedef void(^ActionBlock)(void);
@interface emptyView : UIView

@property(nonatomic,strong) UIImageView *emptyImageView;
@property(nonatomic,strong) UILabel *emptyTitle;
@property(nonatomic,strong) UILabel *emptyDetail;
@property(nonatomic,strong) UIButton *emptyReloadBut;
@property(nonatomic,assign) EmptyType emptyType;


@property(nonatomic,copy) ActionBlock actionBlock;
@property(nonatomic,strong) UIColor *emptyBackgroundColor;
@property(nonatomic,copy) NSString *emptyImageName;
@property(nonatomic,copy) NSString *emptyDetailStr;
@property(nonatomic,copy) NSString *emptyReloadButStr;
@property(nonatomic,copy) NSString *emptyTitleStr;


+ (instancetype)emptyViewiconName:(NSString *)iconName Title:(NSString *)Title detailTitle:(NSString *)detailTitle actionButtonTitle:(NSString *)actionButtonTitle actionBlock:(void(^)(void))actionBlock; 

-(void)hiddenEmptyView;






@end

//
//  emptyView.m
//  dataEmpty
//
//  Created by apple on 2018/6/26.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "emptyView.h"

@implementation emptyView

-(instancetype)init{
    if (self = [super init]) {
        [self configUI];

    }
    return self;
}

+ (instancetype)emptyViewiconName:(NSString *)iconName Title:(NSString *)Title detailTitle:(NSString *)detailTitle actionButtonTitle:(NSString *)actionButtonTitle actionBlock:(void(^)(void))actionBlock{
    emptyView *emptyV = [self new];
    emptyV.emptyType = enptyDataType;
    emptyV.emptyImageName = iconName;
    emptyV.emptyTitleStr = Title;
    emptyV.emptyDetailStr = detailTitle;
    if (!actionButtonTitle) {
        emptyV.emptyReloadBut.hidden = YES;
        emptyV.emptyReloadButStr = actionButtonTitle;
        emptyV.actionBlock = actionBlock;

    }
    
    return emptyV;
}

-(void)hiddenEmptyView{
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)configUI{
    self.backgroundColor = self.emptyBackgroundColor?self.emptyBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    self.frame = [UIScreen mainScreen].bounds;

    [self addSubview:self.emptyImageView];
    [self addSubview:self.emptyTitle];
    [self addSubview:self.emptyDetail];
    [self addSubview:self.emptyReloadBut];

}

-(void)setEmptyImageName:(NSString *)emptyImageName{
    [_emptyImageView setImage:[UIImage imageNamed:emptyImageName]];
}
-(void)setEmptyTitleStr:(NSString *)emptyTitleStr{
    _emptyTitle.text = emptyTitleStr;

}

-(void)setEmptyDetailStr:(NSString *)emptyDetailStr{
    _emptyDetail.text = emptyDetailStr;
}

-(void)setEmptyReloadButStr:(NSString *)emptyReloadButStr{
    [_emptyReloadBut setTitle:emptyReloadButStr forState:0];
}


-(void)didTapButton:(UIButton *)sender{
    if (self.actionBlock) {
        self.actionBlock();
    }
}


- (UIImageView *)emptyImageView
{
    if (!_emptyImageView)
    {
        _emptyImageView = [UIImageView new];
        _emptyImageView.frame = CGRectMake(0, 0, 100, 100);
        _emptyImageView.center = CGPointMake(self.center.x, self.center.y-120);
        _emptyImageView.backgroundColor = [UIColor clearColor];
        _emptyImageView.contentMode = UIViewContentModeScaleAspectFit;
        _emptyImageView.userInteractionEnabled = NO;
        _emptyImageView.accessibilityIdentifier = @"empty set background image";
        
        [self addSubview:_emptyImageView];
    }
    return _emptyImageView;
}

- (UILabel *)emptyTitle
{
    if (!_emptyTitle)
    {
        _emptyTitle = [UILabel new];
        _emptyTitle.frame = CGRectMake(20, CGRectGetMaxY(_emptyImageView.frame)+20, [UIScreen mainScreen].bounds.size.width - 40, 40);
        _emptyTitle.backgroundColor = [UIColor clearColor];
        
        _emptyTitle.font = [UIFont systemFontOfSize:27.0];
        _emptyTitle.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _emptyTitle.textAlignment = NSTextAlignmentCenter;
        _emptyTitle.lineBreakMode = NSLineBreakByWordWrapping;
        _emptyTitle.numberOfLines = 0;
        _emptyTitle.accessibilityIdentifier = @"empty set title";
        
        [self addSubview:_emptyTitle];
    }
    return _emptyTitle;
}

- (UILabel *)emptyDetail
{
    if (!_emptyDetail)
    {
        _emptyDetail = [UILabel new];
        _emptyDetail.frame = CGRectMake(20, CGRectGetMaxY(_emptyTitle.frame)+20, [UIScreen mainScreen].bounds.size.width - 40, 60);
        _emptyDetail.backgroundColor = [UIColor clearColor];
        
        _emptyDetail.font = [UIFont systemFontOfSize:17.0];
        _emptyDetail.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
        _emptyDetail.textAlignment = NSTextAlignmentCenter;
        _emptyDetail.lineBreakMode = NSLineBreakByWordWrapping;
        _emptyDetail.numberOfLines = 0;
        _emptyDetail.accessibilityIdentifier = @"empty set detail label";
        
    }
    return _emptyDetail;
}

- (UIButton *)emptyReloadBut
{
    if (!_emptyReloadBut)
    {
        _emptyReloadBut = [UIButton buttonWithType:UIButtonTypeCustom];
        _emptyReloadBut.frame = CGRectMake(20, CGRectGetMaxY(_emptyDetail.frame)+60, [UIScreen mainScreen].bounds.size.width - 40, 44);
        _emptyReloadBut.backgroundColor = [UIColor clearColor];
        _emptyReloadBut.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _emptyReloadBut.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _emptyReloadBut.accessibilityIdentifier = @"empty set button";
        _emptyReloadBut.layer.borderWidth = 1.0;
        _emptyReloadBut.layer.borderColor = [UIColor blackColor].CGColor;
        [_emptyReloadBut addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:_emptyReloadBut];
    }
    return _emptyReloadBut;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

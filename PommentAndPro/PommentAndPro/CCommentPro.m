//
//  CCommentPro.m
//  PommentAndPro
//
//  Created by mac on 16/12/9.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "CCommentPro.h"

#define Width 170       // 固定宽
#define Height 37       // 固定高

@interface CCommentPro () {

    BOOL _isLike;        // 是否已经点赞

    UIView *_line;
    UIButton *_proButton;
    UIButton *_comButton;
    
}

@end

@implementation CCommentPro


- (instancetype)initWithFrame:(CGRect)frame state:(BOOL)isLike {

    // 固定宽高
    CGRect rect = frame;
    rect.size.width = Width;
    rect.size.height = Height;
    self = [super initWithFrame:rect];
    if (self != nil) {
        _isLike = isLike;
        self.clipsToBounds = YES;
        
        
        
        
        // 创建子视图
        [self _creatSubviews];
    }
    return self;

}



- (void)_creatSubviews {
    
    // 点赞
    _proButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _proButton.frame = CGRectMake(0 + Width, 0, Width/2.0, Height);
    if (_isLike == YES) {
        [_proButton setImage:[UIImage imageNamed:@"icon_liked"] forState:UIControlStateNormal];
        [_proButton setImage:[UIImage imageNamed:@"icon_liked_highlight"] forState:UIControlStateHighlighted];
    } else {
        [_proButton setImage:[UIImage imageNamed:@"icon_like_nor"] forState:UIControlStateNormal];
        [_proButton setImage:[UIImage imageNamed:@"icon_like_nor_highlight"] forState:UIControlStateHighlighted];
    }
    [_proButton addTarget:self action:@selector(proAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_proButton];
    
    // 评论
    _comButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _comButton.frame = CGRectMake(Width/2.0 + Width, 0, Width/2.0, Height);
    [_comButton setImage:[UIImage imageNamed:@"icon_comment_nor"] forState:UIControlStateNormal];
    [_comButton setImage:[UIImage imageNamed:@"icon_comment_highlight"] forState:UIControlStateHighlighted];
    [_comButton addTarget:self action:@selector(comAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_comButton];
    
    // 中间分割线
    _line = [[UIView alloc] initWithFrame:CGRectMake(Width/2.0 + Width, 5, .5, Height-10)];
    _line.backgroundColor = [UIColor colorWithRed:55/255.0 green:61/255.0 blue:64/255.0 alpha:1];
    [self addSubview:_line];
    
    [UIView animateWithDuration:.2
                     animations:^{
                         _line.transform = CGAffineTransformMakeTranslation(-Width, 0);
                         _proButton.transform = CGAffineTransformMakeTranslation(-Width, 0);
                         _comButton.transform = CGAffineTransformMakeTranslation(-Width, 0);
                     }];
    
    

}

- (void)proAction:(UIButton *)button {

    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_liked_down"]];
    imageView.center = CGPointMake(Width/2.0/2.0-7, Height/2.0);
    
    [self addSubview:imageView];
    [UIView animateWithDuration:.15
                     animations:^{
                         imageView.transform = CGAffineTransformMakeScale(4, 4);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:.2
                                          animations:^{
                                              imageView.transform = CGAffineTransformIdentity;
                                          } completion:^(BOOL finished) {
                                              [imageView removeFromSuperview];
                                          }];
                     }];
    
    
    [_delegate proTouch];

}

- (void)comAction:(UIButton *)button {
    
    [_delegate comTouch];
    
}

- (void)lose {

    [UIView animateWithDuration:.2
                     animations:^{
                         _line.transform = CGAffineTransformIdentity;
                         _proButton.transform = CGAffineTransformIdentity;
                         _comButton.transform = CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];

}

































@end

//
//  CCommentPro.h
//  PommentAndPro
//
//  Created by mac on 16/12/9.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCommentProDelegate <NSObject>

- (void)proTouch;
- (void)comTouch;

@end

@interface CCommentPro : UIView

- (instancetype)initWithFrame:(CGRect)frame state:(BOOL)isLike;     // 创建

- (void)lose;   // 失效

@property (weak, nonatomic) id<CCommentProDelegate> delegate;


@end

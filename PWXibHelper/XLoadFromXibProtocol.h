//
//  XNibBridge.h
//  Demo
//
//  Created by Huang Wei on 2017/5/27.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import <UIKit/UIKit.h>


/// 任何UIView的子类只要满足这个协议，那么初始化时就会从对应名字的xib文件中加载。
/// xib中一定要设置File's Owner，否则会报异常
@protocol XLoadFromXibProtocol <NSObject>
@end


@interface UIView (XLoadFromXibProtocol)

/// Xib的containerView
@property (nonatomic, strong) UIView *x_contentView;

@end

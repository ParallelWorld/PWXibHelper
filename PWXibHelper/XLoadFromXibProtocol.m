//
//  XNibBridge.m
//  Demo
//
//  Created by Huang Wei on 2017/5/27.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import "XLoadFromXibProtocol.h"
#import <objc/runtime.h>

@implementation UIView (XLoadFromXibProtocol)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeSelectorFrom:@selector(initWithCoder:) to:@selector(x_initWithCoder:)];
        [self exchangeSelectorFrom:@selector(initWithFrame:) to:@selector(x_initWithFrame:)];
    });
}

- (instancetype)x_initWithCoder:(NSCoder *)aDecoder {
    [self x_initWithCoder:aDecoder];
    if ([self conformsToProtocol:@protocol(XLoadFromXibProtocol)]) {
        [self x_setupView];
    }
    return self;
}

- (instancetype)x_initWithFrame:(CGRect)frame {
    [self x_initWithFrame:frame];
    if ([self conformsToProtocol:@protocol(XLoadFromXibProtocol)]) {
        [self x_setupView];
    }
    return self;
}

+ (void)exchangeSelectorFrom:(SEL)sel1 to:(SEL)sel2 {
    SEL originalSelector = sel1;
    SEL swizzledSelector = sel2;
    Method originalMethod = class_getInstanceMethod(UIView.class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (class_addMethod(UIView.class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(UIView.class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (UIView *)contentView {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setContentView:(UIView *)contentView {
    objc_setAssociatedObject(self, @selector(contentView), contentView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)x_setupView {
    NSString *className = NSStringFromClass(self.class);
    
    NSAssert([[NSBundle mainBundle] pathForResource:className ofType:@"nib"],
             ([NSString stringWithFormat:@"没有找到%@.xib文件", className]));
    
    // 加载nib文件，并对view赋值。
    self.contentView = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];;
    
    // 模仿ViewController中view的设置。
    NSAssert(self.contentView, @"File's Owner没有设置");
    
    [self addSubview:self.contentView];
    
    // 填充整个view
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView.superview
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1
                                                                            constant:0]];
    [self.contentView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                           attribute:NSLayoutAttributeLeft
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView.superview
                                                                           attribute:NSLayoutAttributeLeft
                                                                          multiplier:1
                                                                            constant:0]];
    [self.contentView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView.superview
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1
                                                                            constant:0]];
    [self.contentView.superview addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                           attribute:NSLayoutAttributeBottom
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.contentView.superview
                                                                           attribute:NSLayoutAttributeBottom
                                                                          multiplier:1
                                                                            constant:0]];
}

@end

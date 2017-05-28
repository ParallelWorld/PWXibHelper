//
//  CodeView.m
//  Demo
//
//  Created by Huang Wei on 2017/5/27.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import "CodeView.h"
#import "Masonry.h"
#import "AnotherNibView.h"
#import "AnotherCodeView.h"

@implementation CodeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setupView];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self setupView];
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor grayColor];

    AnotherNibView *nibView = [AnotherNibView new];
    [self addSubview:nibView];
    
    [nibView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.5);
        make.height.equalTo(self).multipliedBy(0.5);
    }];
    
    AnotherCodeView *codeView = [AnotherCodeView new];
    [self addSubview:codeView];
    
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.5);
        make.height.equalTo(self).multipliedBy(0.5);
    }];
}

@end

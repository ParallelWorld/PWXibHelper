//
//  BaseView.m
//  Demo
//
//  Created by Huang Wei on 2017/5/27.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import "BaseView.h"
#import "Masonry.h"

@implementation BaseView

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
    self.centerLabel = [UILabel new];
    self.centerLabel.text = NSStringFromClass(self.class);
    [self addSubview:self.centerLabel];
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
    }];
    
}

@end

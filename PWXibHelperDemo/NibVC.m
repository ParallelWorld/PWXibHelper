//
//  NibVC.m
//  Demo
//
//  Created by Huang Wei on 2017/5/27.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import "NibVC.h"
#import "AnotherNibView.h"
#import "AnotherCodeView.h"
#import "Masonry.h"

@interface NibVC ()


@end

@implementation NibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AnotherNibView *nibView = [AnotherNibView new];
    [self.view addSubview:nibView];
    
    [nibView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.4);
        make.height.equalTo(self.view).multipliedBy(0.4);
    }];
    
    AnotherCodeView *codeView = [AnotherCodeView new];
    [self.view addSubview:codeView];
    
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.4);
        make.height.equalTo(self.view).multipliedBy(0.4);
    }];
}

@end

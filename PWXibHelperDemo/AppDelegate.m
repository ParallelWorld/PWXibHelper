//
//  AppDelegate.m
//  PWXibHelperDemo
//
//  Created by Huang Wei on 2017/5/28.
//  Copyright © 2017年 Parallel World. All rights reserved.
//

#import "AppDelegate.h"
#import "NibVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[NibVC new]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}


@end

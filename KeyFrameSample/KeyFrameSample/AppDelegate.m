//
//  AppDelegate.m
//  KeyFrameSample
//
//  Created by 雄一 on 2012/08/24.
//  Copyright (c) 2012年 nakiwo. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MenuViewController *vc = [[MenuViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navi;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end

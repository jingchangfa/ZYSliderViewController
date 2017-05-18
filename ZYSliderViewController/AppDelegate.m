//
//  AppDelegate.m
//  ZYSliderViewController
//
//  Created by zY on 16/11/9.
//  Copyright © 2016年 zY. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYLeftViewController.h"
#import "ZYMainViewController.h"
#import "ZYSliderViewController.h"
#import "ZYRightViewController.h"

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRefreshUI) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];

    ZYMainViewController *tabVC1 = [[ZYMainViewController alloc] init];
    UINavigationController *mainNav1 = [[UINavigationController alloc] initWithRootViewController:tabVC1];
    ZYLeftViewController *tabVC2 = [[ZYLeftViewController alloc] init];
    UINavigationController *mainNav2 = [[UINavigationController alloc] initWithRootViewController:tabVC2];

    ZYLeftViewController *leftVC = [[ZYLeftViewController alloc] init];
    ZYRightViewController *rightVC = [[ZYRightViewController alloc] init];

    RDVTabBarController *tab = [[RDVTabBarController alloc] init];
    tab.viewControllers = @[mainNav1,mainNav2];
    tabVC1.rdv_tabBarItem = [[RDVTabBarItem alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
    tabVC1.rdv_tabBarItem.title = @"1";
    tabVC2.rdv_tabBarItem = [[RDVTabBarItem alloc] initWithFrame:CGRectMake(0, 7, 30, 30)];
    tabVC2.rdv_tabBarItem.title = @"2";

//    tabVC1.rdv_tabBarItem = [[RDVTabBarItem alloc] initWithTitle:@"iteam1" image:[[UIImage alloc] init] tag:0];
//    tabVC2.rdv_tabBarItem = [[UITabBarItem alloc] initWithTitle:@"iteam2" image:[[UIImage alloc] init] tag:1];

    ZYSliderViewController *sliderVC = [[ZYSliderViewController alloc] initWithMainViewController:tab leftViewController:leftVC rightViewController:rightVC];
    
    self.window.backgroundColor = [UIColor redColor];
    self.window.rootViewController = sliderVC;
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)changeRefreshUI
{
    NSLog(@"状态栏将要变化");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"变化" object:nil];
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRefreshUI) name:UIApplicationWillChangeStatusBarFrameNotification object:nil];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

//
//  AppDelegate.m
//  PropertyExchange
//
//  Created by itachi on 16/9/28.
//  Copyright © 2016年 com.itachi. All rights reserved.
//

#import "AppDelegate.h"
#import "PropertyExchange-Swift.h"
#import "YPUIViewController.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    [Fabric with:@[[Crashlytics class]]];
  
  YPHomeTableViewController *centerViewController = [[YPHomeTableViewController alloc] init];
  UINavigationController *navigationCenterViewController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
  
  YPProfileViewController *leftViewController = [[YPProfileViewController alloc] init];
  UINavigationController *navigationLeftViewController = [[UINavigationController alloc] initWithRootViewController:leftViewController];
  
  MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:navigationCenterViewController leftDrawerViewController:navigationLeftViewController];
  self.drawerController = drawerController;
  [drawerController setShowsShadow:NO];
  [drawerController setMaximumLeftDrawerWidth:(CGRectGetWidth([UIScreen mainScreen].bounds) - 40)];
  [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
  [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
  
  self.window = [[UIWindow alloc] init];
  self.window.frame = [UIScreen mainScreen].bounds;
  self.window.rootViewController = drawerController;
  
//  self.window.rootViewController = [[YPUIViewController alloc] init];
  
  [self.window makeKeyAndVisible];
  
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


- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

//
//  AppDelegate.m
//  SpaceHop
//
//  Created by 羽野 真悟 on 13/06/05.
//  Copyright (c) 2013年 Shingo Hano. All rights reserved.
//

#import "AppDelegate.h"
#import "Appirater.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.menuViewController=[[MenuViewController alloc]initWithNibName:@"MenuViewController" bundle:nil];
    self.retinaMenuViewController=[[RetinaMenuViewController alloc]initWithNibName:@"RetinaMenuViewController" bundle:nil];
    self.iPadMenuViewController=[[iPadMenuViewController alloc]initWithNibName:@"iPadMenuViewController" bundle:nil];
    //    menuViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // iPad
        self.window.rootViewController=self.iPadMenuViewController;
    }
    else {
        //iPhone5の画面サイズ(568.0f)かどうかを判定する
        if (bounds.size.height == 568.0f) {
            self.window.rootViewController =self.retinaMenuViewController;
            
        }
        else
        {
            self.window.rootViewController = self.menuViewController;
        }
    }

    [self.window makeKeyAndVisible];
    
    [Appirater setAppId:@"658100634"];
    [Appirater appLaunched:YES];
    [Appirater setDebug:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [Appirater appEnteredForeground:YES];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

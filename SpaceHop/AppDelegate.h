//
//  AppDelegate.h
//  SpaceHop
//
//  Created by 羽野 真悟 on 13/06/05.
//  Copyright (c) 2013年 Shingo Hano. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ViewController.h"
#import "MenuViewController.h"
#import "RetinaMenuViewController.h"
#import "iPadMenuViewController.h"

//@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;
@property (strong,nonatomic) MenuViewController *menuViewController;
@property (strong,nonatomic) RetinaMenuViewController *retinaMenuViewController;
@property (strong,nonatomic) iPadMenuViewController *iPadMenuViewController;


@end

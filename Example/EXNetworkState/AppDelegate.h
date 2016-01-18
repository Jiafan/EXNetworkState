//
//  AppDelegate.h
//  EXNetworkState
//
//  Created by Jiafan on 1/18/16.
//  Copyright © 2016 Jiafan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleReachability+EX.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong)AppleReachability *reachability;

@end


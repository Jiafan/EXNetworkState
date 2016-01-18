//
//  AppleReachability+EX.h
//  UBAKit
//
//  Created by Jiafan on 10/12/15.
//  Copyright © 2015 Jiafan. All rights reserved.
//

#import "AppleReachability.h"

//定义网络状态
typedef NS_ENUM(NSInteger, NWStatus){
    NWStatusNotReachable=0,
    NWStatus2G,
    NWStatusEdge,
    NWStatus3G,
    NWStatus4G,
    NWStatusWifi,
};

@interface AppleReachability (EX)

/**
 *  获取当前网络状态
 *
 *  @return 当前网络状态
 */
+(NWStatus)networkStatus;

/**
 *  获取当前网络状态字符串
 *
 *  @return 当前网络状态字符串
 */
+(NSString *)stringWithNetWorkStatus;

/**
 *  判断是否是WIFI
 *
 *  @return 可用/不可用 BOOL 值
 */
+(BOOL)isWifiEnable;

/**
 *  获取运营商代码
 *
 *  @return 运营商代码
 */
+ (NSString *)getOperatorCode;
@end

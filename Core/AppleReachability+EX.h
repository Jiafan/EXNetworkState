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
/*判断网络是否可用*/
+(NWStatus)networkStatus;

/*判断网络是否可用*/
+(NSString *)stringWithNetWorkStatus;

/*判断是否是WIFI*/
+(BOOL)isWifiEnable;

/*运营商代码*/
+ (NSString *)getOperatorCode;
@end

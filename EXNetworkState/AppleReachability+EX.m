//
//  AppleReachability+EX.m
//  UBAKit
//
//  Created by Jiafan on 10/12/15.
//  Copyright © 2015 Jiafan. All rights reserved.
//

#import "AppleReachability+EX.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
@implementation AppleReachability (EX)
/**
 *  判断网络状态：包含2G,Edge,3G,4G可用和wifi可用和网络不可用
 *
 *  @return 网络状态
 */
+(NWStatus)networkStatus
{
    //wifi可用
    if([self isWifiEnable])
        return NWStatusWifi;
    //蜂窝移动网络可用,再具体细分(2G,3G,4G,2.75G(Edge))
    else if([self isCarrierConnectEnable])
        //运营商网络判断
        return [self carrierStatus];
    //网络不可用
    else
        return NWStatusNotReachable;
}

/*判断网络是否可用*/
+(NSString *)stringWithNetWorkStatus{
    NSString *strStatus = @"网络不可用";
    NWStatus status=[self networkStatus];
    switch (status) {
        case NWStatus2G:
        {
            strStatus = @"2G";
            break;
        }
        case NWStatusEdge:
        {
            strStatus = @"Edge";
            break;
        }
        case NWStatus3G:
        {
            strStatus = @"3G";
            break;
        }
        case NWStatus4G:
        {
            strStatus = @"4G";
            break;
        }
        case NWStatusWifi:
        {
            strStatus = @"WIFI";
            break;
        }
        case NWStatusNotReachable:
        {
            strStatus = @"网络不可用";
            break;
        }
        default:
            break;
    }
    return strStatus;
}
//wifi是否可用
+(BOOL)isWifiEnable
{
    return ([[self reachabilityForLocalWiFi] currentReachabilityStatus]==ReachableViaWiFi);
}
//蜂窝移动网络是否可用
+(BOOL)isCarrierConnectEnable
{
    return ([[self reachabilityForInternetConnection] currentReachabilityStatus]==ReachableViaWWAN);
}

/**
 *  运营商网络状态
 *
 *  @return 网络状态
 */
+(NWStatus)carrierStatus
{
    CTTelephonyNetworkInfo *info=[CTTelephonyNetworkInfo new];
    NSString *status=info.currentRadioAccessTechnology;
    
    if([status isEqualToString:CTRadioAccessTechnologyCDMA1x]||[status isEqualToString:CTRadioAccessTechnologyGPRS])
        return NWStatus2G;
    else if([status isEqualToString:CTRadioAccessTechnologyEdge])
        return NWStatusEdge;
    else if([status isEqualToString:CTRadioAccessTechnologyLTE])
        return NWStatus4G;
    else
        return NWStatus3G;
}

/*运营商代码*/
+ (NSString *) getOperatorCode{
    CTTelephonyNetworkInfo *NetworkInfo = [[CTTelephonyNetworkInfo alloc]init];
    
    NSString *NetworkCode = [[NetworkInfo subscriberCellularProvider] mobileNetworkCode];
    NSString *operatorName=@"";
    if ([NetworkCode isEqualToString:@"00"]) {
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"01"]){
        operatorName=@"CUCC";//@"China Unicom";
    }
    else if([NetworkCode isEqualToString:@"02"]){
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"03"]){
        operatorName=@"CTCC";//@"China Telecom";
    }else if([NetworkCode isEqualToString:@"05"]){
        operatorName=@"CTCC";//@"China Telecom";
    }else if([NetworkCode isEqualToString:@"06"]){
        operatorName=@"CUCC";//@"China Unicom";
    }else if([NetworkCode isEqualToString:@"07"]){
        operatorName=@"CMCC";//@"China Mobile";
    }else if([NetworkCode isEqualToString:@"80"]){
        operatorName=@"China Tietong";
    }
    return  operatorName;
}
@end

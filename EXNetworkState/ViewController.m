//
//  ViewController.m
//  EXNetworkState
//
//  Created by Jiafan on 1/18/16.
//  Copyright © 2016 Jiafan. All rights reserved.
//

#import "ViewController.h"
#import "AppleReachability+EX.h"
@interface ViewController ()
@property (nonatomic,weak)IBOutlet UILabel *statusLAB;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateNWStatus];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNWStatus) name:kAppleReachabilityChangedNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)updateNWStatus
{
    NSString *operatorStr = [AppleReachability getOperatorCode];
    NSString *statusStr = [AppleReachability stringWithNetWorkStatus];
    NSString *intContentStr = [NSString stringWithFormat:@"运营商:%@\n网络状态:%@",operatorStr,statusStr];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:intContentStr attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    [content addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} range:[intContentStr rangeOfString:operatorStr]];
    [content addAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} range:[intContentStr rangeOfString:statusStr]];
    self.statusLAB.attributedText = content;
}
@end

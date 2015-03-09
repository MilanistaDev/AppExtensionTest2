//
//  TodayViewController.m
//  Widget
//
//  Created by 麻生 拓弥 on 2015/03/09.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 用意する画面サイズ(横は固定らしい，縦を長くしすぎるのはNG，スクロールも使用不可)
    self.preferredContentSize = CGSizeMake(320, 170);
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.iOSTestApp"];
    
    // 保存した Key からそれぞれ値を引き出す
    NSString *value1 = [defaults objectForKey:@"label_text"];
    NSString *value2 = [defaults objectForKey:@"textField_text"];
    
    // 本体アプリから取得したものを Today Widget にそれぞれ表示
    _gettextLabel.text = [NSString stringWithFormat:@"Label: %@", value1];
    _gettextFieldLabal.text = [NSString stringWithFormat:@"textField: %@", value2];
    
}

// アプリを起動(URLスキームの作成方法は前回のを参照)
- (IBAction)gotoappAction:(id)sender {
    
    // 作成した URL スキームを指定
    NSURL *myURL = [NSURL URLWithString:@"test2://"];
    // にとばす
    [self.extensionContext openURL:myURL completionHandler:nil];
    
}

// 余白設定(上の余白，横(左)の余白，横(右)の余白，下の余白です)
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, defaultMarginInsets.left, 30, 10);

    return insets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

@end

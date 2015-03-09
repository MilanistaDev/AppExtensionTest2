//
//  ViewController.m
//  AppExtensionTest2
//
//  Created by 麻生 拓弥 on 2015/03/09.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 自作関数で処理
    [self method];
}

-(void) method {
    
    // Label は今回は直打ち
    _labelLabel.text = @"Test";
    
    // テキストフィールドの Placeholder
    _textField.placeholder = @"Please input string.";
    
    
    // UserDefault 宣言(initWithSuiteName なので注意)
    // group.com.iOSTestApp が App Groups で設定した Identifier の ID
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.iOSTestApp"];
    
    // データの保存(Labelの値を label_text という Key に保存)
    [defaults setObject:_labelLabel.text forKey:@"label_text"];
    
    // 値を即時に反映
    [defaults synchronize];
    
    
    // すでにテキストフィールドに入力されている場合
    if ([defaults objectForKey:@"textField_text"] != nil) {
        
        // キーに登録されている文字列を抽出，表示
        NSString* value_string = [defaults stringForKey:@"textField_text"];
        _textField.text = value_string;
    }
    
    // 値が変化(ユーザが変更)したら呼ばれる(キーボードが閉じた時に値を代入)
    [_textField addTarget:self action:@selector(textFieldAction:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_textField];

}


// 編集終了後 Done(改行) を押したとき
- (IBAction)textFieldAction:(id)sender {
    
    // UserDefault 宣言
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.iOSTestApp"];
    [defaults setObject:_textField.text forKey:@"textField_text"];
    
    [defaults synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

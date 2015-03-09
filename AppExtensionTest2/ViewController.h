//
//  ViewController.h
//  AppExtensionTest2
//
//  Created by 麻生 拓弥 on 2015/03/09.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

// 紐付けの際は DidEndOnExit で
- (IBAction)textFieldAction:(id)sender;

@end


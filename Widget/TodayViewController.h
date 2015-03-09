//
//  TodayViewController.h
//  Widget
//
//  Created by 麻生 拓弥 on 2015/03/09.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *gettextLabel;
@property (weak, nonatomic) IBOutlet UILabel *gettextFieldLabal;

- (IBAction)gotoappAction:(id)sender;

@end

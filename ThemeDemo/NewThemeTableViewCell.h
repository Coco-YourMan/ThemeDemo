//
//  NewThemeTableViewCell.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NewThemeState) {
    
    NewThemeStateDownload,
    
    NewThemeStateStart,
    
    NewThemeStateRemove
};

@interface NewThemeTableViewCell : UITableViewCell

@property (nonatomic , strong ) NSDictionary *info;

@property (nonatomic , copy ) void (^clickBlock)(NewThemeTableViewCell * ,NewThemeState);

// 检查主题状态

- (void)checkThemeState;

@end

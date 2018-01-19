//
//  KUTheme.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KUThemeHelper.h"

static NSString * const KUThemeChangingNotificaiton = @"KUThemeChangingNotificaiton";
static NSString * const KUThemeAddTagNotificaiton = @"KUThemeAddTagNotificaiton";
static NSString * const KUThemeRemoveTagNotificaiton = @"KUThemeRemoveTagNotificaiton";
static NSString * const KUThemeAllTags = @"KUThemeAllTags";
static NSString * const KUThemeCurrentTag = @"KUThemeCurrentTag";
static NSString * const KUThemeConfigInfo = @"KUThemeConfigInfo";


@interface KUTheme : NSObject

@property (nonatomic , copy ) NSString *defaultTag;

@property (nonatomic , copy ) NSString *currentTag;

@property (nonatomic , strong ) NSMutableArray *allTags;

@property (nonatomic , strong ) NSMutableDictionary *configInfo;


+ (KUTheme *)shareTheme;

/**
 *  启动主题
 *
 *  @param tag 主题标签
 */
+ (void)startTheme:(NSString *)tag;

/**
 *  默认主题 (必设置 , 应用程序最少需要一个默认主题)
 *
 *
 *  @param tag 主题标签
 */
+ (void)defaultTheme:(NSString *)tag;

/**
 *  当前主题标签
 *
 *  @return 主题标签 tag
 */
+ (NSString *)currentThemeTag;

/**
 *  全部主题标签
 *
 *  @return 主题标签集合
 */
+ (NSArray *)allThemeTag;

/**
 *  添加主题
 *
 *  @param tag 所添加主题的标签
 */
+ (void)addTagToAllTags:(NSString *)tag;

/**
 * 移除主题
 *
 *  @param tag 待移除主题的标签
 */
+ (void)removeTagToAllTags:(NSString *)tag;

/**
 *  对主题进行存档
 */
- (void)saveConfigInfo;

@end

/*
 *
 *          ┌─┐       ┌─┐
 *       ┌──┘ ┴───────┘ ┴──┐
 *       │                 │
 *       │       ───       │
 *       │  ─┬┘       └┬─  │
 *       │                 │
 *       │       ─┴─       │
 *       │                 │
 *       └───┐         ┌───┘
 *           │         │
 *           │         │
 *           │         │
 *           │         └──────────────┐
 *           │                        │
 *           │                        ├─┐
 *           │                        ┌─┘
 *           │                        │
 *           └─┐  ┐  ┌───────┬──┐  ┌──┘
 *             │ ─┤ ─┤       │ ─┤ ─┤
 *             └──┴──┘       └──┴──┘
 *                 神兽 保佑
 *                 代码无BUG!
 */

//
//  KUTheme.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUTheme.h"

#import <objc/runtime.h>
#import <objc/message.h>



@interface KUTheme ()

@end

@implementation KUTheme

#if !__has_feature(objc_arc)
#error "ARC才可以  ( *・ω・)✄╰ひ╯ "
#endif

+ (KUTheme *)shareTheme{
    
    static KUTheme *themeManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        themeManager = [[KUTheme alloc]init];
    });
    
    return themeManager;
}

#pragma mark Public

+ (void)startTheme:(NSString *)tag{
    
    NSAssert([[KUTheme shareTheme].allTags containsObject:tag], @"所启用的主题不存在 - 请检查是否添加了该%@主题的设置" , tag);
    
    if (!tag) return;
    
    [KUTheme shareTheme].currentTag = tag;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KUThemeChangingNotificaiton object:nil userInfo:nil];
}

+ (void)defaultTheme:(NSString *)tag{
    
    if (!tag) return;
    
    [KUTheme shareTheme].defaultTag = tag;
    
    if (![KUTheme shareTheme].currentTag && ![[NSUserDefaults standardUserDefaults] objectForKey:KUThemeCurrentTag]) [KUTheme shareTheme].currentTag = tag;
}

+ (NSString *)currentThemeTag{
    
    return [KUTheme shareTheme].currentTag ? [KUTheme shareTheme].currentTag : [[NSUserDefaults standardUserDefaults] objectForKey:KUThemeCurrentTag];
}

+ (NSArray *)allThemeTag{
    
    return [[KUTheme shareTheme].allTags copy];
}

#pragma mark Private

- (void)setCurrentTag:(NSString *)currentTag{
    
    _currentTag = currentTag;
    
    [[NSUserDefaults standardUserDefaults] setObject:currentTag forKey:KUThemeCurrentTag];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveConfigInfo{
    
    [[NSUserDefaults standardUserDefaults] setObject:self.configInfo forKey:KUThemeConfigInfo];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)addTagToAllTags:(NSString *)tag{
    
    if (![[KUTheme shareTheme].allTags containsObject:tag]) {
        
        [[KUTheme shareTheme].allTags addObject:tag];
        
        [[NSUserDefaults standardUserDefaults] setObject:[KUTheme shareTheme].allTags forKey:KUThemeAllTags];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

+ (void)removeTagToAllTags:(NSString *)tag{
    
    if ([[KUTheme shareTheme].allTags containsObject:tag]) {
        
        [[KUTheme shareTheme].allTags removeObject:tag];
        
        [[NSUserDefaults standardUserDefaults] setObject:[KUTheme shareTheme].allTags forKey:KUThemeAllTags];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

#pragma mark - LazyLoading

- (NSMutableArray *)allTags{
    
    if (!_allTags) _allTags = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:KUThemeAllTags]];
    
    return _allTags;
}

- (NSMutableDictionary *)configInfo{
    
    if (!_configInfo) _configInfo = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:KUThemeConfigInfo]];
    
    return _configInfo;
}

@end

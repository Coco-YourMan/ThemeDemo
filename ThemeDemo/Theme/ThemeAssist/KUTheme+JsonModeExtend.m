//
//  KUTheme+JsonModeExtend.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUTheme+JsonModeExtend.h"
#import "UIColor+ThemeColor.h"

@implementation KUTheme (JsonModeExtend)


+ (void)addThemeConfigWithJson:(NSString *)json Tag:(NSString *)tag ResourcesPath:(NSString *)path{
    
    if (json) {
        
        NSError *jsonError = nil;
        
        NSDictionary *jsonConfigInfo = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
        
        NSAssert(!jsonError, @"添加的主题json配置数据解析错误 - 错误描述");
        NSAssert(jsonConfigInfo, @"添加的主题json配置数据解析为空 - 请检查");
        NSAssert(tag, @"添加的主题json标签不能为空");
        
        if (!jsonError && jsonConfigInfo) {
            
            [[KUTheme shareTheme].configInfo setValue:[NSMutableDictionary dictionaryWithObjectsAndKeys:jsonConfigInfo , @"info", path , @"path" , nil] forKey:tag];
            
            [[KUTheme shareTheme] saveConfigInfo];
            
            [KUTheme addTagToAllTags:tag];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:KUThemeAddTagNotificaiton object:nil userInfo:@{@"tag" : tag}];
        }
        
    }
    
}

+ (void)removeThemeConfigWithTag:(NSString *)tag{
    
    if ([[KUTheme shareTheme].allTags containsObject:tag] && ![[KUTheme shareTheme].defaultTag isEqualToString:tag]) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:KUThemeRemoveTagNotificaiton object:nil userInfo:@{@"tag" : tag}];
        
        [KUTheme removeTagToAllTags:tag];
        
        [[KUTheme shareTheme].configInfo removeObjectForKey:tag];
        
        [[KUTheme shareTheme] saveConfigInfo];
        
        if ([[KUTheme currentThemeTag] isEqualToString:tag]) [KUTheme startTheme:[KUTheme shareTheme].defaultTag];
    }
    
}

+ (NSString *)getResourcesPathWithTag:(NSString *)tag{
    
    NSString *path = [KUTheme shareTheme].configInfo[tag][@"path"];
    
    return path ? path : [[NSBundle mainBundle] bundlePath];
}

+ (id)getValueWithTag:(NSString *)tag Identifier:(NSString *)identifier{
    
    id value = nil;
    
    NSDictionary *configInfo = [KUTheme shareTheme].configInfo[tag];
    
    NSDictionary *info = configInfo[@"info"];
    
    NSDictionary *colorInfo = info[@"color"];
    
    NSString *colorHexString = colorInfo[identifier];
    
    if (colorHexString) {
        
        UIColor *color = [UIColor kuTheme_ColorWithHexString:colorHexString];
        
        if (color && !value) value = color;
    }
    
    NSDictionary *imageInfo = info[@"image"];
    
    NSString *imageName = imageInfo[identifier];
    
    if (imageName) {
        
        NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        NSString *path = configInfo[@"path"];
        
        if (path) path = [documentsPath stringByAppendingPathComponent:path];
        
        UIImage *image = path ? [UIImage imageWithContentsOfFile:[path stringByAppendingPathComponent:imageName]] : [UIImage imageNamed:imageName];
        
        if (!image) image = [UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:imageName]];
        
        if (!image) image = [UIImage imageNamed:imageName];
        
        if (image && !value) value = image;
    }
    
    NSDictionary *otherInfo = info[@"other"];
    
    if (!value) value = otherInfo[identifier];
    
    return value;
}

@end

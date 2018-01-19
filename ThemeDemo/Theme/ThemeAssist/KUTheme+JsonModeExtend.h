//
//  KUTheme+JsonModeExtend.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUTheme.h"

@interface KUTheme (JsonModeExtend)

/**
 *  添加主题设置Json
 *
 *  @param json json字符串
 *  @param tag 主题标签
 *  @param path 资源路径 (在Documents目录下的路径 如果资源不在Documents目录下应传入nil 例: ResourcesPath:@@"themeResources/day/")
 */
+ (void)addThemeConfigWithJson:(NSString *)json Tag:(NSString *)tag ResourcesPath:(NSString *)path;

/**
 *  移除主题设置
 *
 *  @param tag 主题标签
 */
+ (void)removeThemeConfigWithTag:(NSString *)tag;

/**
 *  获取指定主题标签的资源路径
 *
 *  @param tag 主题标签
 *
 *  @return 资源路径 (如为不存在则返回mainBundle路径)
 */
+ (NSString *)getResourcesPathWithTag:(NSString *)tag;

/**
 *  获取值
 *
 *  @param tag          主题标签
 *  @param identifier   标识符
 *
 *  @return 值对象 (UIColor或UIImage或NSString 如为不存在则返回nil)
 */
+ (id)getValueWithTag:(NSString *)tag Identifier:(NSString *)identifier;

@end

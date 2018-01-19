//
//  KUThemeConfigModel.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUThemeConfigModel.h"
#import "KUTheme.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "UIColor+ThemeColor.h"

@implementation KUThemeConfigModel

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    objc_removeAssociatedObjects(self);
    
    _modelCurrentThemeTag = nil;
    _modelThemeBlockConfigInfo = nil;
    _modelThemeKeyPathConfigInfo = nil;
    _modelThemeSelectorConfigInfo = nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KUTheme_RemoveThemeTagNotify:) name:KUThemeRemoveTagNotificaiton object:nil];
    }
    return self;
}

- (void)KUTheme_RemoveThemeTagNotify:(NSNotification *)notify{
    
    NSString *tag = notify.userInfo[@"tag"];
    
    self.KUClearAllConfig_Tag(tag);
}

- (void)updateCurrentThemeConfigHandleWithTag:(NSString *)tag{
    
    if ([[KUTheme currentThemeTag] isEqualToString:tag]) {
        
        if ([NSThread isMainThread]) {
            
            if (self.modelUpdateCurrentThemeConfig) self.modelUpdateCurrentThemeConfig();
            
        } else {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (self.modelUpdateCurrentThemeConfig) self.modelUpdateCurrentThemeConfig();
            });
        }
        
    }
    
}

- (KUConfigThemeToChangingBlock)KUThemeChangingBlock{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(KUThemeChangingBlock changingBlock){
        
        if (changingBlock) {
            
            weakSelf.modelChangingBlock = changingBlock;
            
            if (weakSelf.modelConfigThemeChangingBlock) weakSelf.modelConfigThemeChangingBlock();
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_Block)KUAddCustomConfig{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , KUThemeConfigBlock configBlock){
        
        if (configBlock) {
            
            [KUTheme addTagToAllTags:tag];
            
            NSMutableDictionary *info = weakSelf.modelThemeBlockConfigInfo[tag];
            
            if (!info) info = [NSMutableDictionary dictionary];
            
            [info setObject:[NSNull null] forKey:configBlock];
            
            [weakSelf.modelThemeBlockConfigInfo setObject:info forKey:tag];
            
            [weakSelf updateCurrentThemeConfigHandleWithTag:tag];
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToTs_Block)KUAddCustomConfigs{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSArray *tags , KUThemeConfigBlock configBlock){
        
        if (configBlock) {
            
            [tags enumerateObjectsUsingBlock:^(NSString *tag, NSUInteger idx, BOOL * _Nonnull stop) {
                
                [KUTheme addTagToAllTags:tag];
                
                NSMutableDictionary *info = weakSelf.modelThemeBlockConfigInfo[tag];
                
                if (!info) info = [NSMutableDictionary dictionary];
                
                [info setObject:[NSNull null] forKey:configBlock];
                
                [weakSelf.modelThemeBlockConfigInfo setObject:info forKey:tag];
                
                [weakSelf updateCurrentThemeConfigHandleWithTag:tag];
            }];
            
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_Color)KUAddTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddTextColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setTextColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddFillColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setFillColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddStrokeColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setStrokeColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddBorderColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setBorderColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddShadowColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setShadowColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddOnTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setOnTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddThumbTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setThumbTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddSeparatorColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setSeparatorColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddBarTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setBarTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddBackgroundColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setBackgroundColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddPlaceholderColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddKeyPathAndValue(tag , @"_placeholderLabel.textColor" , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddTrackTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setTrackTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddProgressTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setProgressTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddHighlightedTextColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setHighlightedTextColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddCurrentPageIndicatorTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setCurrentPageIndicatorTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_Color)KUAddPageIndicatorTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id color){
        
        return weakSelf.KUAddSelectorAndColor(tag , @selector(setPageIndicatorTintColor:) , color);
    };
    
}

- (KUConfigThemeToT_ColorAndState)KUAddButtonTitleColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , UIColor *color , UIControlState state){
        
        return weakSelf.KUAddSelectorAndValues(tag , @selector(setTitleColor:forState:) , color , @(state) , nil);
    };
    
}

- (KUConfigThemeToT_ColorAndState)KUAddButtonTitleShadowColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , UIColor *color , UIControlState state){
        
        return weakSelf.KUAddSelectorAndValues(tag , @selector(setTitleShadowColor:forState:) , color , @(state), nil);
    };
    
}

- (KUConfigThemeToT_Image)KUAddImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddTrackImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setTrackImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddProgressImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setProgressImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddShadowImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setShadowImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddSelectedImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setSelectedImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setBackgroundImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddBackIndicatorImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setBackIndicatorImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddBackIndicatorTransitionMaskImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setBackIndicatorTransitionMaskImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddSelectionIndicatorImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setSelectionIndicatorImage:) , image);
    };
    
}

- (KUConfigThemeToT_Image)KUAddScopeBarBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , id image){
        
        return weakSelf.KUAddSelectorAndImage(tag , @selector(setScopeBarBackgroundImage:) , image);
    };
    
}

- (KUConfigThemeToT_ImageAndState)KUAddButtonImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , UIImage *image , UIControlState state){
        
        return weakSelf.KUAddSelectorAndValues(tag , @selector(setImage:forState:) , image , @(state), nil);
    };
    
}

- (KUConfigThemeToT_ImageAndState)KUAddButtonBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , UIImage *image , UIControlState state){
        
        return weakSelf.KUAddSelectorAndValues(tag , @selector(setBackgroundImage:forState:) , image , @(state), nil);
    };
    
}

- (KUConfigThemeToT_SelectorAndColor)KUAddSelectorAndColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , SEL sel , id color){
        
        id value = nil;
        
        if ([color isKindOfClass:NSString.class]) {
            
            value = [UIColor kuTheme_ColorWithHexString:color];
            
        } else {
            
            value = color;
        }
        
        if (value) weakSelf.KUAddSelectorAndValueArray(tag , sel , @[value]);
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_SelectorAndImage)KUAddSelectorAndImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , SEL sel , id image){
        
        id value = nil;
        
        if ([image isKindOfClass:NSString.class]) {
            
            value = [UIImage imageNamed:image];
            
            if (!value) value = [UIImage imageWithContentsOfFile:image];
            
        } else {
            
            value = image;
        }
        
        if (value) weakSelf.KUAddSelectorAndValueArray(tag , sel , @[value]);
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_KeyPathAndValue)KUAddKeyPathAndValue{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , NSString *keyPath , id value){
        
        if (!value) return weakSelf;
        
        [KUTheme addTagToAllTags:tag];
        
        NSMutableDictionary *info = weakSelf.modelThemeKeyPathConfigInfo[keyPath];
        
        if (!info) info = [NSMutableDictionary dictionary];
        
        [info setObject:value forKey:tag];
        
        [weakSelf.modelThemeKeyPathConfigInfo setObject:info forKey:keyPath];
        
        [weakSelf updateCurrentThemeConfigHandleWithTag:tag];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_SelectorAndValues)KUAddSelectorAndValues{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag, SEL sel , ...){
        
        if (!sel) return weakSelf;
        
        NSMutableArray *array = [NSMutableArray array];
        
        va_list argsList;
        
        va_start(argsList, sel);
        
        id arg;
        
        while ((arg = va_arg(argsList, id))) {
            
            [array addObject:arg];
        }
        
        va_end(argsList);
        
        return weakSelf.KUAddSelectorAndValueArray(tag, sel, array);
    };
    
}

- (KUConfigThemeToT_SelectorAndValueArray)KUAddSelectorAndValueArray{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag, SEL sel , NSArray *values){
        
        if (!tag) return weakSelf;
        
        if (!sel) return weakSelf;
        
        [KUTheme addTagToAllTags:tag];
        
        NSString *key = NSStringFromSelector(sel);
        
        NSMutableDictionary *info = weakSelf.modelThemeSelectorConfigInfo[key];
        
        if (!info) info = [NSMutableDictionary dictionary];
        
        NSMutableArray *valuesArray = info[tag];
        
        if (!valuesArray) valuesArray = [NSMutableArray array];
        
        [[valuesArray copy] enumerateObjectsUsingBlock:^(NSArray *valueArray, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([valueArray isEqualToArray:values]) [valuesArray removeObject:valueArray]; // 过滤相同参数值的数组
        }];
        
        if (values && values.count) [valuesArray addObject:values];
        
        [info setObject:valuesArray forKey:tag];
        
        [weakSelf.modelThemeSelectorConfigInfo setObject:info forKey:key];
        
        [weakSelf updateCurrentThemeConfigHandleWithTag:tag];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_KeyPath)KURemoveKeyPath{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , NSString *keyPath){
        
        NSMutableDictionary *info = weakSelf.modelThemeKeyPathConfigInfo[keyPath];
        
        if (info) {
            
            [info removeObjectForKey:tag];
            
            [weakSelf.modelThemeKeyPathConfigInfo setObject:info forKey:keyPath];
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToT_Selector)KURemoveSelector{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag , SEL sel){
        
        NSMutableDictionary *info = weakSelf.modelThemeSelectorConfigInfo[NSStringFromSelector(sel)];
        
        if (info) {
            
            [info removeObjectForKey:tag];
            
            [weakSelf.modelThemeSelectorConfigInfo setObject:info forKey:NSStringFromSelector(sel)];
        }
        
        return weakSelf;
    };
    
}

- (KUConfigTheme)KUClearAllConfig{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(){
        
        weakSelf.modelChangingBlock = nil;
        
        [weakSelf.modelThemeBlockConfigInfo removeAllObjects];
        
        [weakSelf.modelThemeKeyPathConfigInfo removeAllObjects];
        
        [weakSelf.modelThemeSelectorConfigInfo removeAllObjects];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToTag)KUClearAllConfig_Tag{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *tag){
        
        [weakSelf.modelThemeBlockConfigInfo removeObjectForKey:tag];
        
        for (id keyPath in [weakSelf.modelThemeKeyPathConfigInfo copy]) {
            
            weakSelf.KURemoveKeyPath(tag, keyPath);
        }
        
        for (id selector in [weakSelf.modelThemeSelectorConfigInfo copy]) {
            
            weakSelf.KURemoveSelector(tag, NSSelectorFromString(selector));
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToKeyPath)KUClearAllConfig_KeyPath{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *keyPath){
        
        [weakSelf.modelThemeKeyPathConfigInfo removeObjectForKey:keyPath];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToSelector)KUClearAllConfig_Selector{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(SEL selector){
        
        [weakSelf.modelThemeSelectorConfigInfo removeObjectForKey:NSStringFromSelector(selector)];
        
        return weakSelf;
    };
    
}

#pragma mark - LazyLoading

- (NSMutableDictionary *)modelThemeBlockConfigInfo{
    
    if (!_modelThemeBlockConfigInfo) _modelThemeBlockConfigInfo = [NSMutableDictionary dictionary];
    
    return _modelThemeBlockConfigInfo;
}

- (NSMutableDictionary *)modelThemeKeyPathConfigInfo{
    
    if (!_modelThemeKeyPathConfigInfo) _modelThemeKeyPathConfigInfo = [NSMutableDictionary dictionary];
    
    return _modelThemeKeyPathConfigInfo;
}

- (NSMutableDictionary *)modelThemeSelectorConfigInfo{
    
    if (!_modelThemeSelectorConfigInfo) _modelThemeSelectorConfigInfo = [NSMutableDictionary dictionary];
    
    return _modelThemeSelectorConfigInfo;
}



@end

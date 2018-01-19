//
//  KUThemeConfigModel+IdentifierMoeExtend.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUThemeConfigModel+IdentifierMoeExtend.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation KUThemeConfigModel (IdentifierMoeExtend)


- (KUConfigThemeToIdentifierAndBlock)KUCustomConfig{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier , KUThemeConfigBlockToValue configBlock){
        
        if (configBlock) {
            
            for (NSString *tag in [KUTheme shareTheme].allTags) {
                
                id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                
                if (value) {
                    
                    NSMutableDictionary *info = weakSelf.modelThemeBlockConfigInfo[tag];
                    
                    if (!info) info = [NSMutableDictionary dictionary];
                    
                    [info setObject:value forKey:configBlock];
                    
                    [weakSelf.modelThemeBlockConfigInfo setObject:info forKey:tag];
                    
                    [weakSelf updateCurrentThemeConfigHandleWithTag:tag];
                }
                
            }
            
            NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[@(KUThemeIdentifierConfigTypeBlock)];
            
            if (!info) info = [NSMutableDictionary dictionary];
            
            [info setObject:identifier forKey:configBlock];
            
            [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:@(KUThemeIdentifierConfigTypeBlock)];
        }
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigTextColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setTextColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigFillColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setFillColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigStrokeColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setStrokeColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBorderColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBorderColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigShadowColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setShadowColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigOnTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setOnTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigThumbTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setThumbTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigSeparatorColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setSeparatorColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBarTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBarTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBackgroundColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBackgroundColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigPlaceholderColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigKeyPathAndIdentifier(@"_placeholderLabel.textColor" , identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigTrackTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setTrackTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigProgressTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setProgressTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigHighlightedTextColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setHighlightedTextColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigPageIndicatorTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setPageIndicatorTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigCurrentPageIndicatorTintColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setCurrentPageIndicatorTintColor:), identifier);
    };
    
}

- (KUConfigThemeToIdentifierAndState)KUConfigButtonTitleColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier , UIControlState state){
        
        return weakSelf.KUConfigSelectorAndValueArray(@selector(setTitleColor:forState:), @[[KUThemeIdentifier ident:identifier], @(state)]);
    };
    
}

- (KUConfigThemeToIdentifierAndState)KUConfigButtonTitleShadowColor{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier , UIControlState state){
        
        return weakSelf.KUConfigSelectorAndValueArray(@selector(setTitleShadowColor:forState:), @[[KUThemeIdentifier ident:identifier], @(state)]);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigTrackImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setTrackImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigProgressImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setProgressImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigShadowImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setShadowImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigSelectedImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setSelectedImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBackgroundImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBackIndicatorImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBackIndicatorImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigBackIndicatorTransitionMaskImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setBackIndicatorTransitionMaskImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigSelectionIndicatorImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setSelectionIndicatorImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifier)KUConfigScopeBarBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndIdentifier(@selector(setScopeBarBackgroundImage:), identifier);
    };
    
}

- (KUConfigThemeToIdentifierAndState)KUConfigButtonImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier , UIControlState state){
        
        return weakSelf.KUConfigSelectorAndValueArray(@selector(setImage:forState:), @[[KUThemeIdentifier ident:identifier], @(state)]);
    };
    
}

- (KUConfigThemeToIdentifierAndState)KUConfigButtonBackgroundImage{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier , UIControlState state){
        
        weakSelf.KUConfigSelectorAndValueArray(@selector(setBackgroundImage:forState:), @[[KUThemeIdentifier ident:identifier], @(state)]);
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToKeyPathAndIdentifier)KUConfigKeyPathAndIdentifier{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *keyPath , NSString *identifier){
        
        for (NSString *tag in [KUTheme shareTheme].allTags) {
            
            id value = [KUTheme getValueWithTag:tag Identifier:identifier];
            
            if (value) weakSelf.KUAddKeyPathAndValue(tag, keyPath, value);
        }
        
        NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[@(KUThemeIdentifierConfigTypeKeyPath)];
        
        if (!info) info = [NSMutableDictionary dictionary];
        
        [info setObject:identifier forKey:keyPath];
        
        [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:@(KUThemeIdentifierConfigTypeKeyPath)];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToSelectorAndIdentifier)KUConfigSelectorAndIdentifier{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(SEL sel , NSString *identifier){
        
        return weakSelf.KUConfigSelectorAndValueArray(sel , @[[KUThemeIdentifier ident:identifier]]);
    };
    
}

- (KUConfigThemeToSelectorAndValues)KUConfigSelectorAndValueArray{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(SEL sel , NSArray *values){
        
        for (NSString *tag in [KUTheme shareTheme].allTags) {
            
            NSMutableArray *valueArray = [NSMutableArray array];
            
            for (id value in values) {
                
                id v = value;
                
                if ([value isKindOfClass:KUThemeIdentifier.class]) {
                    
                    v = [KUTheme getValueWithTag:tag Identifier:value];
                }
                
                if (v) [valueArray addObject:v];
            }
            
            if (valueArray.count == values.count && valueArray.count) weakSelf.KUAddSelectorAndValueArray(tag, sel, valueArray);
        }
        
        NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[@(KUThemeIdentifierConfigTypeSelector)];
        
        if (!info) info = [NSMutableDictionary dictionary];
        
        if (values) [info setObject:NSStringFromSelector(sel) forKey:values];
        
        [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:@(KUThemeIdentifierConfigTypeSelector)];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToKeyPath)KURemoveKeyPathIdentifier{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *keyPath){
        
        id type = @(KUThemeIdentifierConfigTypeKeyPath);
        
        NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[type];
        
        for (id key in [info copy]) {
            
            if ([key isEqualToString:keyPath]) {
                
                for (NSString *tag in [KUTheme shareTheme].allTags) {
                    
                    if ([KUTheme getValueWithTag:tag Identifier:info[key]]) weakSelf.KURemoveKeyPath(tag, keyPath);
                }
                
                [info removeObjectForKey:key];
            }
            
        }
        
        if (info) [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:type];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToSelector)KURemoveSelectorIdentifier{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(SEL sel){
        
        id type = @(KUThemeIdentifierConfigTypeSelector);
        
        NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[type];
        
        for (id key in [info copy]) {
            
            if ([info[key] isEqualToString:NSStringFromSelector(sel)]) {
                
                NSArray *values = key;
                
                for (id value in values) {
                    
                    if ([value isKindOfClass:KUThemeIdentifier.class]) {
                        
                        for (NSString *tag in [KUTheme shareTheme].allTags) {
                            
                            if ([KUTheme getValueWithTag:tag Identifier:value]) weakSelf.KURemoveSelector(tag, NSSelectorFromString(info[key]));
                        }
                        
                    }
                    
                }
                
                [info removeObjectForKey:key];
            }
            
        }
        
        if (info) [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:type];
        
        return weakSelf;
    };
    
}

- (KUConfigThemeToIdentifier)KURemoveIdentifier{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(NSString *identifier){
        
        for (id type in [weakSelf.modelThemeIdentifierConfigInfo copy]) {
            
            NSMutableDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[type];
            
            for (id key in [info copy]) {
                
                switch ([type integerValue]) {
                        
                    case KUThemeIdentifierConfigTypeBlock:
                    {
                        if ([info[key] isEqualToString:identifier]) {
                            
                            for (NSString *tag in [KUTheme shareTheme].allTags) {
                                
                                id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                                
                                if (!value) continue;
                                
                                NSMutableDictionary *info = weakSelf.modelThemeBlockConfigInfo[tag];
                                
                                if (info) {
                                    
                                    [info removeObjectForKey:key];
                                    
                                    [weakSelf.modelThemeBlockConfigInfo setObject:info forKey:tag];
                                }
                                
                            }
                            
                            [info removeObjectForKey:key];
                        }
                        
                    }
                        break;
                        
                    case KUThemeIdentifierConfigTypeKeyPath:
                    {
                        if ([info[key] isEqualToString:identifier]) {
                            
                            for (NSString *tag in [KUTheme shareTheme].allTags) {
                                
                                id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                                
                                if (!value) continue;
                                
                                weakSelf.KURemoveKeyPath(tag, key);
                            }
                            
                            [info removeObjectForKey:key];
                        }
                        
                    }
                        break;
                        
                    case KUThemeIdentifierConfigTypeSelector:
                    {
                        BOOL remove = NO;
                        
                        NSArray *values = key;
                        
                        for (id value in values) {
                            
                            if ([value isKindOfClass:KUThemeIdentifier.class]) {
                                
                                if ([value isEqualToString:identifier]) {
                                    
                                    for (NSString *tag in [KUTheme shareTheme].allTags) {
                                        
                                        if ([KUTheme getValueWithTag:tag Identifier:value]) weakSelf.KURemoveSelector(tag, NSSelectorFromString(info[key]));
                                    }
                                    
                                    remove = YES;
                                }
                                
                            }
                            
                        }
                        
                        if (remove) [info removeObjectForKey:key];
                    }
                        break;
                        
                    default:
                        break;
                }
                
            }
            
            if (info) [weakSelf.modelThemeIdentifierConfigInfo setObject:info forKey:type];
        }
        
        return weakSelf;
    };
    
}

- (KUConfigTheme)KUClearAllConfigOnIdentifierMode{
    
    __weak typeof(self) weakSelf = self;
    
    return ^(){
        
        for (NSNumber *type in weakSelf.modelThemeIdentifierConfigInfo) {
            
            NSDictionary *info = weakSelf.modelThemeIdentifierConfigInfo[type];
            
            for (id key in info) {
                
                switch ([type integerValue]) {
                        
                    case KUThemeIdentifierConfigTypeBlock:
                    {
                        for (NSString *tag in [KUTheme allThemeTag]) {
                            
                            NSMutableDictionary *blockInfo = weakSelf.modelThemeBlockConfigInfo[tag];
                            
                            if (!blockInfo) blockInfo = [NSMutableDictionary dictionary];
                            
                            for (id key in [blockInfo copy]) {
                                
                                if (![blockInfo[key] isKindOfClass:NSNull.class]) [blockInfo removeObjectForKey:key];
                            }
                            
                            [weakSelf.modelThemeBlockConfigInfo setObject:blockInfo forKey:tag];
                        }
                        
                    }
                        break;
                        
                    case KUThemeIdentifierConfigTypeKeyPath:
                    {
                        NSString *identifier = info[key];
                        
                        for (NSString *tag in [KUTheme allThemeTag]) {
                            
                            id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                            
                            if (!value) continue;
                            
                            weakSelf.KURemoveKeyPath(tag, key);
                        }
                        
                    }
                        break;
                        
                    case KUThemeIdentifierConfigTypeSelector:
                    {
                        NSArray *values = key;
                        
                        for (NSString *tag in [KUTheme shareTheme].allTags) {
                            
                            BOOL remove = NO;
                            
                            for (id value in values) {
                                
                                if ([value isKindOfClass:KUThemeIdentifier.class]) {
                                    
                                    if ([KUTheme getValueWithTag:tag Identifier:value]) remove = YES;
                                }
                                
                            }
                            
                            if (remove) weakSelf.KURemoveSelector(tag, NSSelectorFromString(info[key]));
                        }
                        
                    }
                        break;
                        
                    default:
                        break;
                }
                
            }
            
        }
        
        [weakSelf.modelThemeIdentifierConfigInfo removeAllObjects];
        
        return weakSelf;
    };
    
}

- (void)KUTheme_AddThemeTagNotify:(NSNotification *)notify{
    
    NSString *tag = notify.userInfo[@"tag"];
    
    NSDictionary *configInfo = self.modelThemeIdentifierConfigInfo;
    
    for (NSNumber *type in configInfo) {
        
        NSDictionary *info = configInfo[type];
        
        for (id key in info) {
            
            switch ([type integerValue]) {
                    
                case KUThemeIdentifierConfigTypeBlock:
                {
                    NSString *identifier = info[key];
                    
                    id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                    
                    if (value) {
                        
                        NSMutableDictionary *blockInfo = self.modelThemeBlockConfigInfo[tag];
                        
                        if (!blockInfo) blockInfo = [NSMutableDictionary dictionary];
                        
                        [blockInfo setObject:value forKey:key];
                        
                        [self.modelThemeBlockConfigInfo setObject:blockInfo forKey:tag];
                    }
                }
                    break;
                    
                case KUThemeIdentifierConfigTypeKeyPath:
                {
                    NSString *identifier = info[key];
                    
                    id value = [KUTheme getValueWithTag:tag Identifier:identifier];
                    
                    if (value) self.KUAddKeyPathAndValue(tag, key, value);
                }
                    break;
                    
                case KUThemeIdentifierConfigTypeSelector:
                {
                    NSArray *values = key;
                    
                    NSMutableArray *valueArray = [NSMutableArray array];
                    
                    for (id value in values) {
                        
                        id v = value;
                        
                        if ([value isKindOfClass:KUThemeIdentifier.class]) {
                            
                            v = [KUTheme getValueWithTag:tag Identifier:value];
                        }
                        
                        if (v) [valueArray addObject:v];
                    }
                    
                    if (valueArray.count == values.count && valueArray.count) self.KUAddSelectorAndValueArray(tag, NSSelectorFromString(info[key]), valueArray);
                }
                    break;
                    
                default:
                    break;
            }
            
        }
        
    }
    
}

- (NSMutableDictionary *)modelThemeIdentifierConfigInfo{
    
    /**
     *  @{type : @{(keypath or block) : identifier}}
     *
     *  @{type : @{values : selector}}
     */
    NSMutableDictionary *dic = objc_getAssociatedObject(self, _cmd);
    
    if (!dic) {
        
        dic = [NSMutableDictionary dictionary];
        
        objc_setAssociatedObject(self, _cmd, dic , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KUTheme_AddThemeTagNotify:) name:KUThemeAddTagNotificaiton object:nil];
    }
    
    return dic;
}

- (void)setModelThemeIdentifierConfigInfo:(NSMutableDictionary *)modelThemeIdentifierConfigInfo{
    
    objc_setAssociatedObject(self, @selector(modelThemeIdentifierConfigInfo), modelThemeIdentifierConfigInfo , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

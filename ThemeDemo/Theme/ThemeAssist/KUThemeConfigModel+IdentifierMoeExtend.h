//
//  KUThemeConfigModel+IdentifierMoeExtend.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUThemeConfigModel.h"
#import "KUTheme.h"
#import "KUTheme+JsonModeExtend.h"
#import "KUThemeIdentifier.h"

typedef NS_ENUM(NSInteger, KUThemeIdentifierConfigType) {
    
    /** 标识符设置类型 - Block */
    
    KUThemeIdentifierConfigTypeBlock,
    
    /** 标识符设置类型 - 路径,方法 */
    
    KUThemeIdentifierConfigTypeKeyPath,
    KUThemeIdentifierConfigTypeSelector
};

@interface KUThemeConfigModel (IdentifierMoeExtend)


/** Block */

/** 自定义设置 -> 格式: .KUCustomConfig(@@"identifier" , ^(id item , id value){ code... }) */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifierAndBlock KUCustomConfig;

/** Color快捷设置方法 */

/** 设置渲染颜色标识符 -> 格式: .KUConfigTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigTintColor;

/** 设置文本颜色标识符 -> 格式: .KUConfigTextColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigTextColor;

/** 设置填充颜色标识符 -> 格式: .KUConfigFillColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigFillColor;

/** 设置笔画颜色标识符 -> 格式: .KUConfigStrokeColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigStrokeColor;

/** 设置边框颜色标识符 -> 格式: .KUConfigBorderColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBorderColor;

/** 设置文本颜色标识符 -> 格式: .KUConfigShadowColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigShadowColor;

/** 设置开关开启颜色标识符 -> 格式: .KUConfigOnTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigOnTintColor;

/** 设置开关按钮颜色标识符 -> 格式: .KUConfigThumbTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigThumbTintColor;

/** 设置分隔线颜色标识符 -> 格式: .KUConfigSeparatorColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigSeparatorColor;

/** 设置bar渲染颜色标识符 -> 格式: .KUConfigBarTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBarTintColor;

/** 设置背景颜色标识符 -> 格式: .KUConfigBackgroundColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBackgroundColor;

/** 设置占位符颜色标识符 -> 格式: .KUConfigPlaceholderColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigPlaceholderColor;

/** 设置进度轨道渲染颜色标识符 -> 格式: .KUConfigTrackTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigTrackTintColor;

/** 设置进度渲染颜色标识符 -> 格式: .KUConfigProgressTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigProgressTintColor;

/** 设置高亮文本颜色标识符 -> 格式: .KUConfigHighlightedTextColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigHighlightedTextColor;

/** 设置页数指示渲染颜色标识符 -> 格式: .KUConfigPageIndicatorTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigPageIndicatorTintColor;

/** 设置当前页数指示渲染颜色标识符 -> 格式: .KUConfigCurrentPageIndicatorTintColor(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigCurrentPageIndicatorTintColor;

/** 设置按钮标题颜色标识符 -> 格式: .KUConfigButtonTitleColor(@@"identifier" , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifierAndState KUConfigButtonTitleColor;

/** 设置按钮标题阴影颜色标识符 -> 格式: .KUConfigButtonTitleColor(@@"identifier" , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifierAndState KUConfigButtonTitleShadowColor;

/** Image快捷设置方法 */

/** 设置图片标识符 -> 格式: .KUConfigImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigImage;

/** 设置进度轨道图片标识符 -> 格式: .KUConfigTrackImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigTrackImage;

/** 设置进度图片标识符 -> 格式: .KUConfigProgressImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigProgressImage;

/** 设置阴影图片标识符 -> 格式: .KUConfigShadowImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigShadowImage;

/** 设置选中图片标识符 -> 格式: .KUConfigSelectedImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigSelectedImage;

/** 设置背景图片标识符 -> 格式: .KUConfigBackgroundImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBackgroundImage;

/** 设置返回指示图片标识符 -> 格式: .KUConfigBackIndicatorImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBackIndicatorImage;

/** 设置返回指示图片标识符 -> 格式: .KUConfigBackIndicatorTransitionMaskImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigBackIndicatorTransitionMaskImage;

/** 设置选择指示器图片标识符 -> 格式: .KUConfigSelectionIndicatorImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigSelectionIndicatorImage;

/** 设置分栏背景图片标识符 -> 格式: .KUConfigScopeBarBackgroundImage(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KUConfigScopeBarBackgroundImage;

/** 设置按钮图片标识符 -> 格式: .KUConfigButtonImage(@@"identifier" , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifierAndState KUConfigButtonImage;

/** 设置按钮背景图片标识符 -> 格式: .KUConfigButtonBackgroundImage(@@"identifier" , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifierAndState KUConfigButtonBackgroundImage;

/** 基础设置方法 */

/** 设置路径标识符 -> 格式: .KUConfigKeyPathAndIdentifier(@@"keyPath" , @@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToKeyPathAndIdentifier KUConfigKeyPathAndIdentifier;

/** 设置方法标识符 -> 格式: .KUConfigSelectorAndIdentifier(@@selector(XXX:) , @@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToSelectorAndIdentifier KUConfigSelectorAndIdentifier;

/** 设置方法标识符 -> 格式: .KUConfigSelectorAndValueArray(@@selector(XXX:XXX:) , @@[id , id]) */
@property (nonatomic , copy , readonly ) KUConfigThemeToSelectorAndValues KUConfigSelectorAndValueArray;

/** 移除路径标识符设置 -> 格式: .KURemoveKeyPathIdentifier(@@"keyPath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToKeyPath KURemoveKeyPathIdentifier;

/** 移除方法标识符设置 -> 格式: .KURemoveSelectorIdentifier(@@selector(XXX:)) */
@property (nonatomic , copy , readonly ) KUConfigThemeToSelector KURemoveSelectorIdentifier;

/** 移除标识符设置 -> 格式: .KURemoveIdentifier(@@"identifier") */
@property (nonatomic , copy , readonly ) KUConfigThemeToIdentifier KURemoveIdentifier;


/** 移除全部设置(标识符模式) -> 格式: .KUClearAllConfigOnIdentifierMode() */
@property (nonatomic , copy , readonly ) KUConfigTheme KUClearAllConfigOnIdentifierMode;

@end

//
//  KUThemeConfigModel.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KUThemeHelper.h"

@interface KUThemeConfigModel : NSObject

@property (nonatomic , copy ) void(^modelUpdateCurrentThemeConfig)(void);
@property (nonatomic , copy ) void(^modelConfigThemeChangingBlock)(void);

@property (nonatomic , copy ) KUThemeChangingBlock modelChangingBlock;

@property (nonatomic , copy ) NSString *modelCurrentThemeTag;

@property (nonatomic , strong ) NSMutableDictionary <NSString * , NSMutableDictionary *>*modelThemeBlockConfigInfo; // @{tag : @{block : value}}
@property (nonatomic , strong ) NSMutableDictionary <NSString * , NSMutableDictionary *>*modelThemeKeyPathConfigInfo; // @{keypath : @{tag : value}}
@property (nonatomic , strong ) NSMutableDictionary <NSString * , NSMutableDictionary *>*modelThemeSelectorConfigInfo; // @{selector : @{tag : @[@[parameter, parameter,...] , @[...]]}}


/** ----默认设置方式---- */

/** Block */

/** 主题改变Block -> 格式: .KUThemeChangingBlock(^(NSString *tag , id item){ code... }) */
@property (nonatomic , copy , readonly ) KUConfigThemeToChangingBlock KUThemeChangingBlock;

/** 添加自定义设置 -> 格式: .KUAddCustomConfig(@@"tag" , ^(id item){ code... }) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Block KUAddCustomConfig;

/** 添加多标签自定义设置 -> 格式: .KUAddCustomConfigs(@@[tag1 , tag2] , ^(id item){ code... }) */
@property (nonatomic , copy , readonly ) KUConfigThemeToTs_Block KUAddCustomConfigs;

/** Color快捷设置方法 */

/** 添加渲染颜色设置 -> 格式: .KUAddTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddTintColor;

/** 添加文本颜色设置 -> 格式: .KUAddTextColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddTextColor;

/** 添加填充颜色设置 -> 格式: .KUAddFillColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddFillColor;

/** 添加笔画颜色设置 -> 格式: .KUAddStrokeColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddStrokeColor;

/** 添加边框颜色设置 -> 格式: .KUAddBorderColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddBorderColor;

/** 添加阴影颜色设置 -> 格式: .KUAddShadowColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddShadowColor;

/** 添加开关开启颜色设置 -> 格式: .KUAddOnTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddOnTintColor;

/** 添加开关按钮颜色设置 -> 格式: .KUAddThumbTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddThumbTintColor;

/** 添加分隔线颜色设置 -> 格式: .KUAddSeparatorColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddSeparatorColor;

/** 添加bar渲染颜色设置 -> 格式: .KUAddBarTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddBarTintColor;

/** 添加背景颜色设置 -> 格式: .KUAddBackgroundColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddBackgroundColor;

/** 添加占位符颜色设置 -> 格式: .KUAddPlaceholderColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddPlaceholderColor;

/** 添加进度轨道渲染颜色设置 -> 格式: .KUAddTrackTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddTrackTintColor;

/** 添加进度渲染颜色设置 -> 格式: .KUAddProgressTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddProgressTintColor;

/** 添加高亮文本颜色设置 -> 格式: .KUAddHighlightedTextColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddHighlightedTextColor;

/** 添加页数指示渲染颜色设置 -> 格式: .KUAddPageIndicatorTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddPageIndicatorTintColor;

/** 添加当前页数指示渲染颜色设置 -> 格式: .KUAddCurrentPageIndicatorTintColor(@@"tag" , UIColor) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Color KUAddCurrentPageIndicatorTintColor;

/** 添加按钮标题颜色设置 -> 格式: .KUAddButtonTitleColor(@@"tag" , UIColor , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_ColorAndState KUAddButtonTitleColor;

/** 添加按钮标题阴影颜色设置 -> 格式: .KUAddButtonTitleShadowColor(@@"tag" , UIColor , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_ColorAndState KUAddButtonTitleShadowColor;

/** Image快捷设置方法 */

/** 添加图片设置 -> 格式: .KUAddImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddImage;

/** 添加进度轨道图片设置 -> 格式: .KUAddTrackImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddTrackImage;

/** 添加进度图片设置 -> 格式: .KUAddProgressImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddProgressImage;

/** 添加阴影图片设置 -> 格式: .KUAddShadowImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddShadowImage;

/** 添加选中图片设置 -> 格式: .KUAddSelectedImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddSelectedImage;

/** 添加背景图片设置 -> 格式: .KUAddBackgroundImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddBackgroundImage;

/** 添加返回指示图片设置 -> 格式: .KUAddBackIndicatorImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddBackIndicatorImage;

/** 添加返回指示图片设置 -> 格式: .KUAddBackIndicatorTransitionMaskImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddBackIndicatorTransitionMaskImage;

/** 添加选择指示器图片设置 -> 格式: .KUAddSelectionIndicatorImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddSelectionIndicatorImage;

/** 添加分栏背景图片设置 -> 格式: .KUAddScopeBarBackgroundImage(@@"tag" , UIImage 或 @@"imageName" 或 @@"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Image KUAddScopeBarBackgroundImage;

/** 添加按钮图片设置 -> 格式: .KUAddButtonImage(@@"tag" , UIImage , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_ImageAndState KUAddButtonImage;

/** 添加按钮背景图片设置 -> 格式: .KUAddButtonBackgroundImage(@@"tag" , UIImage , UIControlStateNormal) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_ImageAndState KUAddButtonBackgroundImage;


/** 添加颜色设置 -> 格式: .KUAddSelectorAndColor(@@"tag" , @@selector(XXX:) , UIColor 或 @"F3F3F3") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_SelectorAndColor KUAddSelectorAndColor;

/** 添加图片设置 -> 格式: .KUAddSelectorAndImage(@@"tag" , @@selector(XXX:) , UIImage 或 @"imageName" 或 @"imagePath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_SelectorAndImage KUAddSelectorAndImage;


/** 基础设置方法 */

/** 添加路径设置 -> 格式: .KUAddKeyPathAndValue(@@"tag" , @@"keyPath" , id) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_KeyPathAndValue KUAddKeyPathAndValue;

/** 添加方法设置 -> 格式: .KUAddSelectorAndValues(@@"tag" , @@selector(XXX:XXX:) , id , id) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_SelectorAndValues KUAddSelectorAndValues;

/** 添加方法设置 -> 格式: .KUAddSelectorAndValueArray(@@"tag" , @@selector(XXX:XXX:) , @@[id , id]) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_SelectorAndValueArray KUAddSelectorAndValueArray;

/** 移除路径设置 -> 格式: .KURemoveKeyPath(@@"tag" , @@"keyPath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_KeyPath KURemoveKeyPath;

/** 移除方法设置 -> 格式: .KURemoveSelector(@@"tag" , @@selector(XXX:XXX:)) */
@property (nonatomic , copy , readonly ) KUConfigThemeToT_Selector KURemoveSelector;


/** 移除全部设置 -> 格式: .KUClearAllConfig() */
@property (nonatomic , copy , readonly ) KUConfigTheme KUClearAllConfig;

/** 移除标签全部的设置 -> 格式: .KUClearAllConfig_Tag(@@"tag") */
@property (nonatomic , copy , readonly ) KUConfigThemeToTag KUClearAllConfig_Tag;

/** 移除路径全部的设置 -> 格式: .KUClearAllConfig_KeyPath(@@"keyPath") */
@property (nonatomic , copy , readonly ) KUConfigThemeToKeyPath KUClearAllConfig_KeyPath;

/** 移除方法全部的设置 -> 格式: .KUClearAllConfig_Selector(@selector(XXXX:)) */
@property (nonatomic , copy , readonly ) KUConfigThemeToSelector KUClearAllConfig_Selector;

- (void)updateCurrentThemeConfigHandleWithTag:(NSString *)tag;

@end

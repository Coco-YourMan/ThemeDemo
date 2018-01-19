//
//  KUThemeHelper.h
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

FOUNDATION_EXPORT double KUThemeVersionNumber;
FOUNDATION_EXPORT const unsigned char KUThemeVersionString[];

#ifndef KUThemeHelper_h
#define KUThemeHelper_h
#import <UIKit/UIKit.h>

@class KUThemeConfigModel;

#pragma mark - 宏

#define DAY         @"day"
#define NIGHT       @"night"

#define KUColorRGBA(R , G , B , A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#define KUColorRGB(R , G , B) KUColorRGBA(R , G , B , 1.0f)

#define KUColorHex(hex) [UIColor KUTheme_ColorWithHexString:hex]

#define KUColorFromIdentifier(tag, identifier) ({((UIColor *)([KUTheme getValueWithTag:tag Identifier:identifier]));})

#define KUImageFromIdentifier(tag, identifier) ({((UIImage *)([KUTheme getValueWithTag:tag Identifier:identifier]));})

#define KUValueFromIdentifier(tag, identifier) ({([KUTheme getValueWithTag:tag Identifier:identifier]);})

#pragma mark - typedef

typedef void(^KUThemeConfigBlock)(id item);
typedef void(^KUThemeConfigBlockToValue)(id item , id value);
typedef void(^KUThemeChangingBlock)(NSString *tag , id item);
typedef KUThemeConfigModel *(^KUConfigTheme)(void);
typedef KUThemeConfigModel *(^KUConfigThemeToFloat)(CGFloat number);
typedef KUThemeConfigModel *(^KUConfigThemeToTag)(NSString *tag);
typedef KUThemeConfigModel *(^KUConfigThemeToKeyPath)(NSString *keyPath);
typedef KUThemeConfigModel *(^KUConfigThemeToSelector)(SEL selector);
typedef KUThemeConfigModel *(^KUConfigThemeToIdentifier)(NSString *identifier);
typedef KUThemeConfigModel *(^KUConfigThemeToChangingBlock)(KUThemeChangingBlock);
typedef KUThemeConfigModel *(^KUConfigThemeToT_KeyPath)(NSString *tag , NSString *keyPath);
typedef KUThemeConfigModel *(^KUConfigThemeToT_Selector)(NSString *tag , SEL selector);
typedef KUThemeConfigModel *(^KUConfigThemeToT_Color)(NSString *tag , id color);
typedef KUThemeConfigModel *(^KUConfigThemeToT_Image)(NSString *tag , id image);
typedef KUThemeConfigModel *(^KUConfigThemeToT_Block)(NSString *tag , KUThemeConfigBlock);
typedef KUThemeConfigModel *(^KUConfigThemeToTs_Block)(NSArray *tags , KUThemeConfigBlock);
typedef KUThemeConfigModel *(^KUConfigThemeToKeyPathAndIdentifier)(NSString *keyPath , NSString *identifier);
typedef KUThemeConfigModel *(^KUConfigThemeToSelectorAndIdentifier)(SEL sel , NSString *identifier);
typedef KUThemeConfigModel *(^KUConfigThemeToSelectorAndIdentifierAndValueIndexAndValueArray)(SEL sel , NSString *identifier , NSInteger valueIndex , NSArray *otherValues);
typedef KUThemeConfigModel *(^KUConfigThemeToSelectorAndValues)(SEL sel , NSArray *values);
typedef KUThemeConfigModel *(^KUConfigThemeToIdentifierAndState)(NSString *identifier , UIControlState state);
typedef KUThemeConfigModel *(^KUConfigThemeToT_ColorAndState)(NSString *tag , UIColor *color , UIControlState state);
typedef KUThemeConfigModel *(^KUConfigThemeToT_ImageAndState)(NSString *tag , UIImage *image , UIControlState state);
typedef KUThemeConfigModel *(^KUConfigThemeToT_KeyPathAndValue)(NSString *tag , NSString *keyPath , id value);
typedef KUThemeConfigModel *(^KUConfigThemeToT_SelectorAndColor)(NSString *tag , SEL sel , id color);
typedef KUThemeConfigModel *(^KUConfigThemeToT_SelectorAndImage)(NSString *tag , SEL sel , id image);
typedef KUThemeConfigModel *(^KUConfigThemeToT_SelectorAndValues)(NSString *tag , SEL sel , ...);
typedef KUThemeConfigModel *(^KUConfigThemeToT_SelectorAndValueArray)(NSString *tag , SEL sel , NSArray *values);
typedef KUThemeConfigModel *(^KUConfigThemeToIdentifierAndBlock)(NSString *identifier , KUThemeConfigBlockToValue);


#endif /* KUThemeHelper_h */

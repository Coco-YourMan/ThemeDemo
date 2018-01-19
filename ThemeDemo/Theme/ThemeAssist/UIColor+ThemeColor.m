//
//  UIColor+ThemeColor.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "UIColor+ThemeColor.h"

@implementation UIColor (ThemeColor)

+ (UIColor *)kuTheme_ColorWithHexString:(NSString *)hexString{
    
    if (!hexString) return nil;
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    
    CGFloat alpha, red, blue, green;
    
    switch ([colorString length]) {
        case 0:
            return nil;
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString start: 0 length: 1];
            green = [self colorComponentFrom:colorString start: 1 length: 1];
            blue  = [self colorComponentFrom:colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom:colorString start: 0 length: 1];
            red   = [self colorComponentFrom:colorString start: 1 length: 1];
            green = [self colorComponentFrom:colorString start: 2 length: 1];
            blue  = [self colorComponentFrom:colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom:colorString start: 0 length: 2];
            green = [self colorComponentFrom:colorString start: 2 length: 2];
            blue  = [self colorComponentFrom:colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom:colorString start: 0 length: 2];
            red   = [self colorComponentFrom:colorString start: 2 length: 2];
            green = [self colorComponentFrom:colorString start: 4 length: 2];
            blue  = [self colorComponentFrom:colorString start: 6 length: 2];
            break;
        default:
            (void)(alpha = 0), (void)(red = 0), (void)(blue = 0), green = 0;
            break;
    }
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)colorComponentFrom:(NSString *) string start:(NSUInteger)start length:(NSUInteger) length{
    
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0f;
}

@end

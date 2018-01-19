//
//  KUThemeIdentifier.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "KUThemeIdentifier.h"

@implementation KUThemeIdentifier
{
    NSString *_backingStore;
}

+ (KUThemeIdentifier *)ident:(NSString *)ident{
    
    return [[KUThemeIdentifier alloc] initWithString:ident];
}

- (id)initWithString:(NSString *)aString
{
    if (self = [self init]) {
        
        _backingStore = [[NSString stringWithString:aString] copy];
    }
    return self;
}

- (NSUInteger)length{
    
    return [_backingStore length];
}

- (unichar)characterAtIndex:(NSUInteger)index{
    
    return [_backingStore characterAtIndex:index];
}

@end

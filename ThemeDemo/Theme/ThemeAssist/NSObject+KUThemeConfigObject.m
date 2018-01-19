//
//  NSObject+KUThemeConfigObject.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "NSObject+KUThemeConfigObject.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation NSObject (KUThemeConfigObject)

+ (void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSArray *selStringsArray = @[@"dealloc"];
        
        [selStringsArray enumerateObjectsUsingBlock:^(NSString *selString, NSUInteger idx, BOOL *stop) {
            
            NSString *KUSelString = [@"KU_theme_" stringByAppendingString:selString];
            
            Method originalMethod = class_getInstanceMethod(self, NSSelectorFromString(selString));
            
            Method KUMethod = class_getInstanceMethod(self, NSSelectorFromString(KUSelString));
            
            BOOL isAddedMethod = class_addMethod(self, NSSelectorFromString(selString), method_getImplementation(KUMethod), method_getTypeEncoding(KUMethod));
            
            if (isAddedMethod) {
                
                class_replaceMethod(self, NSSelectorFromString(KUSelString), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
                
            } else {
                
                method_exchangeImplementations(originalMethod, KUMethod);
            }
            
        }];
        
    });
    
}

- (void)KU_theme_dealloc{
    
    if ([self isKUTheme]) {
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:KUThemeChangingNotificaiton object:nil];
        
        objc_removeAssociatedObjects(self);
    }
    
    [self KU_theme_dealloc];
}

- (BOOL)isChangeTheme{
    
    return (!self.KU_theme.modelCurrentThemeTag || ![self.KU_theme.modelCurrentThemeTag isEqualToString:[KUTheme currentThemeTag]]) ? YES : NO;
}

- (void)KUTheme_ChangeThemeConfigNotify:(NSNotification *)notify{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if ([self isChangeTheme]) {
            
            if (self.KU_theme.modelChangingBlock) self.KU_theme.modelChangingBlock([KUTheme currentThemeTag] , self);
            
            [CATransaction begin];
            
            [CATransaction setDisableActions:YES];
            
            [self changeThemeConfig];
            
            [CATransaction commit];
        }
        
    });
    
}

- (void)setInv:(NSInvocation *)inv Sig:(NSMethodSignature *)sig Obj:(id)obj Index:(NSInteger)index{
    
    if (sig.numberOfArguments <= index) return;
    
    char *type = (char *)[sig getArgumentTypeAtIndex:index];
    
    while (*type == 'r' || // const
           *type == 'n' || // in
           *type == 'N' || // inout
           *type == 'o' || // out
           *type == 'O' || // bycopy
           *type == 'R' || // byref
           *type == 'V') { // oneway
        type++; // cutoff useless prefix
    }
    
    BOOL unsupportedType = NO;
    
    switch (*type) {
        case 'v': // 1: void
        case 'B': // 1: bool
        case 'c': // 1: char / BOOL
        case 'C': // 1: unsigned char
        case 's': // 2: short
        case 'S': // 2: unsigned short
        case 'i': // 4: int / NSInteger(32bit)
        case 'I': // 4: unsigned int / NSUInteger(32bit)
        case 'l': // 4: long(32bit)
        case 'L': // 4: unsigned long(32bit)
        { // 'char' and 'short' will be promoted to 'int'.
            int value = [obj intValue];
            [inv setArgument:&value atIndex:index];
        } break;
            
        case 'q': // 8: long long / long(64bit) / NSInteger(64bit)
        case 'Q': // 8: unsigned long long / unsigned long(64bit) / NSUInteger(64bit)
        {
            long long value = [obj longLongValue];
            [inv setArgument:&value atIndex:index];
        } break;
            
        case 'f': // 4: float / CGFloat(32bit)
        { // 'float' will be promoted to 'double'.
            double value = [obj doubleValue];
            float valuef = value;
            [inv setArgument:&valuef atIndex:index];
        } break;
            
        case 'd': // 8: double / CGFloat(64bit)
        {
            double value = [obj doubleValue];
            [inv setArgument:&value atIndex:index];
        } break;
            
        case '*': // char *
        case '^': // pointer
        {
            if ([obj isKindOfClass:UIColor.class]) obj = (id)[obj CGColor]; //CGColor转换
            if ([obj isKindOfClass:UIImage.class]) obj = (id)[obj CGImage]; //CGImage转换
            void *value = (__bridge void *)obj;
            [inv setArgument:&value atIndex:index];
        } break;
            
        case '@': // id
        {
            id value = obj;
            [inv setArgument:&value atIndex:index];
        } break;
            
        case '{': // struct
        {
            if (strcmp(type, @encode(CGPoint)) == 0) {
                CGPoint value = [obj CGPointValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGSize)) == 0) {
                CGSize value = [obj CGSizeValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGRect)) == 0) {
                CGRect value = [obj CGRectValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGVector)) == 0) {
                CGVector value = [obj CGVectorValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CGAffineTransform)) == 0) {
                CGAffineTransform value = [obj CGAffineTransformValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(CATransform3D)) == 0) {
                CATransform3D value = [obj CATransform3DValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(NSRange)) == 0) {
                NSRange value = [obj rangeValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(UIOffset)) == 0) {
                UIOffset value = [obj UIOffsetValue];
                [inv setArgument:&value atIndex:index];
            } else if (strcmp(type, @encode(UIEdgeInsets)) == 0) {
                UIEdgeInsets value = [obj UIEdgeInsetsValue];
                [inv setArgument:&value atIndex:index];
            } else {
                unsupportedType = YES;
            }
        } break;
            
        case '(': // union
        {
            unsupportedType = YES;
        } break;
            
        case '[': // array
        {
            unsupportedType = YES;
        } break;
            
        default: // what?!
        {
            unsupportedType = YES;
        } break;
    }
    
    NSAssert(unsupportedType == NO, @"方法的参数类型暂不支持");
}

- (void)changeThemeConfig{
    
    self.KU_theme.modelCurrentThemeTag = [KUTheme currentThemeTag];
    
    NSString *tag = [KUTheme currentThemeTag];
    
    // Block
    
    for (id blockKey in self.KU_theme.modelThemeBlockConfigInfo[tag]) {
        
        id value = self.KU_theme.modelThemeBlockConfigInfo[tag][blockKey];
        
        if ([value isKindOfClass:NSNull.class]) {
            
            KUThemeConfigBlock block = (KUThemeConfigBlock)blockKey;
            
            if (block) block(self);
            
        } else {
            
            KUThemeConfigBlockToValue block = (KUThemeConfigBlockToValue)blockKey;
            
            if (block) block(self , value);
        }
        
    }
    
    // KeyPath
    
    for (id keyPath in self.KU_theme.modelThemeKeyPathConfigInfo) {
        
        NSDictionary *info = self.KU_theme.modelThemeKeyPathConfigInfo[keyPath];
        
        id value = info[tag];
        
        if ([keyPath isKindOfClass:NSString.class]) {
            
            [self setValue:value forKeyPath:keyPath];
        }
        
    }
    
    // Selector
    
    for (NSString *selector in self.KU_theme.modelThemeSelectorConfigInfo) {
        
        NSDictionary *info = self.KU_theme.modelThemeSelectorConfigInfo[selector];
        
        NSArray *valuesArray = info[tag];
        
        for (NSArray *values in valuesArray) {
            
            SEL sel = NSSelectorFromString(selector);
            
            NSMethodSignature * sig = [self methodSignatureForSelector:sel];
            
            if (!sig) [self doesNotRecognizeSelector:sel];
            
            NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
            
            if (!inv) [self doesNotRecognizeSelector:sel];
            
            [inv setTarget:self];
            
            [inv setSelector:sel];
            
            if (sig.numberOfArguments == values.count + 2) {
                
                [values enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    
                    NSInteger index = idx + 2;
                    
                    [self setInv:inv Sig:sig Obj:obj Index:index];
                }];
                
                [inv invoke];
                
            } else {
                
                NSAssert(YES, @"参数个数与方法参数个数不匹配");
            }
            
        }
        
    }
    
}

- (KUThemeConfigModel *)KU_theme{
    
    KUThemeConfigModel *model = objc_getAssociatedObject(self, _cmd);
    
    if (!model) {
        
        NSAssert(![self isKindOfClass:[KUThemeConfigModel class]], @"是不是点多了? ( *・ω・)✄╰ひ╯ ");
        
        model = [KUThemeConfigModel new];
        
        objc_setAssociatedObject(self, _cmd, model , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(KUTheme_ChangeThemeConfigNotify:) name:KUThemeChangingNotificaiton object:nil];
        
        [self setIsKUTheme:YES];
        
        __weak typeof(self) weakSelf = self;
        
        model.modelUpdateCurrentThemeConfig = ^{
            
            if (weakSelf) [weakSelf changeThemeConfig];
        };
        
        model.modelConfigThemeChangingBlock = ^{
            
            if (weakSelf) weakSelf.KU_theme.modelChangingBlock([KUTheme currentThemeTag], weakSelf);
        };
        
    }
    
    return model;
}

- (void)setKU_theme:(KUThemeConfigModel *)KU_theme{
    
    if(self) objc_setAssociatedObject(self, @selector(KU_theme), KU_theme , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isKUTheme{
    
    return self ? [objc_getAssociatedObject(self, _cmd) boolValue] : NO;
}

- (void)setIsKUTheme:(BOOL)isKUTheme{
    
    if (self) objc_setAssociatedObject(self, @selector(isKUTheme), @(isKUTheme) , OBJC_ASSOCIATION_ASSIGN);
}



@end

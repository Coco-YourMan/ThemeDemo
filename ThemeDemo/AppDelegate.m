//
//  AppDelegate.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/17.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "KUBubble.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark - 获取document路径

- (NSString *)documentPath{
    
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    return array.firstObject;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 设置主题
    
    [self configTheme];
    
    // 初始化window
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[TabBarController alloc] init];
    
    // 初始化气泡
    
    KUBubble *bubble = [[KUBubble alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.window.frame) - 58, CGRectGetHeight(self.window.frame) - 123, 48, 48)];
    
    bubble.edgeInsets = UIEdgeInsetsMake(64, 0 , 0 , 0);
    
    [self.window addSubview:bubble];
    
    bubble.KU_theme
    .KUAddSelectorAndColor(DAY, @selector(setColor:), [UIColor orangeColor])
    .KUAddSelectorAndColor(NIGHT, @selector(setColor:), [UIColor grayColor])
    .KUConfigSelectorAndIdentifier(@selector(setColor:), @"ident1")
    .KUThemeChangingBlock(^(NSString *tag, KUBubble * item) {
        
        if ([tag isEqualToString:DAY]) {
            
            item.image = [UIImage imageNamed:@"night"];
            
        } else if ([tag isEqualToString:NIGHT]) {
            
            item.image = [UIImage imageNamed:@"day"];
            
        } else {
            
            item.image = [UIImage imageNamed:@"day"];
        }
        
    });
    
    __weak typeof(self) weakSelf = self;
    
    bubble.clickBubbleBlock = ^(){
        
        if (weakSelf){
            
            /*  这是一种巧妙的方法 良好的过渡效果可以很好地提高体验 可以根据你的使用场景来进行尝试
             
             关于文字颜色改变时增加过渡的动画效果这点很不好处理, 如果增加动画处理 那么最终导致切换主题时文字颜色与其他颜色或图片不能很好地统一过渡, 效果上总会有些不自然.
             原理: 切换主题前 获取当前window的快照视图 并覆盖到window上 > 执行主题切换 > 将覆盖的快照视图通过动画隐藏 显示出切换完成的真实window.
             场景: 比较适用于阅读类APP切换日夜间主题场景.
             优点: 过渡效果自然统一, 可根据自行调整不同的动画效果等.
             缺点: 如果当前显示的内容不处于静止状态 那么会产生一种残影的感觉, 例如 列表滑动时切换
             总结: 可以根据你的使用场景来进行尝试, 一切只为了更好的体验 但也无需强求.
             */
            
            // 覆盖截图
            
            UIView *tempView = [weakSelf.window snapshotViewAfterScreenUpdates:NO];
            
            [weakSelf.window addSubview:tempView];
            
            // 切换主题
            
            if ([[KUTheme currentThemeTag] isEqualToString:DAY]) {
                
                [KUTheme startTheme:NIGHT];
                
            } else {
                
                [KUTheme startTheme:DAY];
            }
            
            // 增加动画 移除覆盖
            
            [UIView animateWithDuration:1.0f animations:^{
                
                tempView.alpha = 0.0f;
                
            } completion:^(BOOL finished) {
                
                [tempView removeFromSuperview];
            }];
            
        }
        
    };
    
    return YES;
}

#pragma mark - 设置主题

- (void)configTheme{
    
    NSString *dayJsonPath = [[NSBundle mainBundle] pathForResource:@"themejson_day" ofType:@"json"];
    
    NSString *nightJsonPath = [[NSBundle mainBundle] pathForResource:@"themejson_night" ofType:@"json"];
    
    NSString *dayJson = [NSString stringWithContentsOfFile:dayJsonPath encoding:NSUTF8StringEncoding error:nil];
    
    NSString *nightJson = [NSString stringWithContentsOfFile:nightJsonPath encoding:NSUTF8StringEncoding error:nil];
    
    
    [KUTheme defaultTheme:DAY];
    
    //    [KUTheme defaultChangeThemeAnimationDuration:0.0f];
    
    [KUTheme addThemeConfigWithJson:dayJson Tag:DAY ResourcesPath:nil];
    
    [KUTheme addThemeConfigWithJson:nightJson Tag:NIGHT ResourcesPath:nil];
}




@end

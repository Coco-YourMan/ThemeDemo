//
//  TabBarController.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@property (nonatomic,strong) NSArray *classArray;

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self initSubControllers];
    
    [self configTabBarItems];
    
    [self configTheme];
}

- (void)initData {
    self.classArray = @[@"ViewController",@"TableViewController"];
}

- (void)configTheme {
    self.tabBar.KU_theme
    .KUAddBarTintColor(DAY, KUColorRGB(255, 255, 255))
    .KUAddBarTintColor(NIGHT, KUColorRGB(40, 40, 40))
    .KUConfigBarTintColor(@"ident1");
    
}

- (void)initSubControllers {
    NSArray *nameArray = @[@"演示" , @"demo"];
    
    NSMutableArray *ncArray = [[NSMutableArray alloc] init];
    
    //循环创建
    
    for (NSInteger i = 0; i < self.classArray.count; i++) {
        
        UINavigationController *nc = self.viewControllers[i];
        
        if (!nc) {
            
            nc = [[UINavigationController alloc] initWithRootViewController:[[NSClassFromString(self.classArray[i])alloc] init]];
            
            nc.navigationBar.KU_theme
            .KUAddBarTintColor(DAY , KUColorRGB(255, 255, 255))
            .KUAddBarTintColor(NIGHT , KUColorRGB(85, 85, 85))
            .KUConfigBarTintColor(@"ident1");
            
            nc.navigationBar.KU_theme
            .KUAddCustomConfig(DAY, ^(UINavigationBar *bar) {
                
                bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
            })
            .KUAddCustomConfig(NIGHT, ^(UINavigationBar *bar) {
                
                bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
            })
            .KUCustomConfig(@"ident7", ^(UINavigationBar *bar, id value) {
                
                bar.titleTextAttributes = @{NSForegroundColorAttributeName : value};
            });
            
            nc.tabBarItem.title = nameArray[i];
        }
        
        [ncArray addObject:nc];
    }
    
    self.viewControllers = ncArray;
}



- (void)configTabBarItems {
    
    //选项属性数组
    NSArray *itemUnselectImageNameArray = @[@"tab_theme" , @"tab_demo"];
    NSArray *itemSelectImageNameArray = @[@"tab_theme_sel" , @"tab_demo_sel"];
    
    for (NSInteger i=0; i < self.classArray.count; i++) {
        UINavigationController *nc = self.viewControllers[i];
        UITabBarItem *tabBarItem = nc.tabBarItem;
        
        //  方法1
        tabBarItem.KU_theme
        .KUAddSelectedImage(DAY, [[UIImage imageNamed:itemSelectImageNameArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
        .KUAddSelectedImage(NIGHT, [[UIImage imageNamed:[NSString stringWithFormat:@"%@_night" , itemSelectImageNameArray[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
        
        tabBarItem.KU_theme
        .KUAddImage(DAY, [[UIImage imageNamed:itemUnselectImageNameArray[i]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])
        .KUAddImage(NIGHT, [[UIImage imageNamed:[NSString stringWithFormat:@"%@_night" , itemUnselectImageNameArray[i]]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]);
        
        tabBarItem.KU_theme
        .KUAddSelectorAndValues(DAY, @selector(setTitleTextAttributes:forState:),@{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:KUColorRGB(33, 151, 216)} , @(UIControlStateSelected) , nil)
        .KUAddSelectorAndValues(DAY , @selector(setTitleTextAttributes:forState:) , @{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:KUColorRGB(159, 159, 159)} , @(UIControlStateNormal) , nil)
        .KUAddSelectorAndValues(NIGHT , @selector(setTitleTextAttributes:forState:) , @{NSFontAttributeName:[UIFont systemFontOfSize:10], NSForegroundColorAttributeName:KUColorRGB(230, 230, 230)} , @(UIControlStateNormal) , nil);
        
        
        
    }
    
}

@end

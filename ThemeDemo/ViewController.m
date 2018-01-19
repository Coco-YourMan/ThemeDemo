//
//  ViewController.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/17.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "ViewController.h"
#import "NewThemeTableViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic , strong ) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"添加主题" style:UIBarButtonItemStyleDone target:self action:@selector(rightItemAction)];
    
    self.navigationItem.rightBarButtonItem = item;
    
    // 初始化数据
    
    [self initData];
    
    // 初始化子视图
    
    [self initSubviews];
    
    // 设置主题样式
    
    [self configTheme];
}

#pragma mark - 初始化数据

- (void)initData{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - 初始化子视图

- (void)initSubviews{
    
    CGFloat centerX = CGRectGetWidth(self.view.frame) / 2;
    
    // 滑动视图
    
    _scrollView = [[UIScrollView alloc] init];
    
    _scrollView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 49);
    
    _scrollView.delegate = self;
    
    if (@available(iOS 11.0, *)) {
        
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    
    [self.view addSubview:_scrollView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
    
    [self.scrollView addGestureRecognizer:tap];
    
    // view
    
    UIView *view = [[UIView alloc] init];
    
    view.frame = CGRectMake(0, 10, 120, 100);
    
    view.center = CGPointMake(centerX, view.center.y);
    
    view.clipsToBounds = YES;
    
    view.layer.borderWidth = 1.5f;
    
    view.layer.cornerRadius = 5.0f;
    
    [self.scrollView addSubview:view];
    
    
    view.KU_theme
    .KUAddBackgroundColor(DAY, KUColorRGB(200, 200, 200))
    .KUAddBackgroundColor(NIGHT, KUColorRGB(40, 40, 40))
    .KUConfigBackgroundColor(@"ident1")
    .KUAddCustomConfig(DAY, ^(UIView *item) {
        
        item.alpha = 1.0f;
    })
    .KUAddCustomConfig(NIGHT, ^(UIView *item) {
        
        item.alpha = 1.0f;
    })
    .KUCustomConfig(@"ident5", ^(UIView *item, id value) {
        
        item.alpha = [value floatValue];
    });
    
    view.layer.KU_theme
    .KUAddBorderColor(DAY, KUColorRGB(160, 160, 160))
    .KUAddBorderColor(NIGHT, KUColorRGB(70, 70, 70))
    .KUConfigBorderColor(@"ident2");
    
    // label
    
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = CGRectMake(0, 130, 200, 30);
    
    label.center = CGPointMake(centerX, label.center.y);
    
    label.text = @"这是一个Label";
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.scrollView addSubview:label];
    
    
    label.KU_theme
    .KUAddTextColor(DAY, KUColorRGB(0, 0, 0))
    .KUAddTextColor(NIGHT, KUColorRGB(200, 200, 200))
    .KUConfigTextColor(@"ident1");
    
    
    // button
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 180, 200, 40.0f);
    
    button.center = CGPointMake(centerX, button.center.y);
    
    [button setTitle:@"这是一个按钮" forState:UIControlStateNormal];
    
    [button setTitle:@"点击了这个按钮" forState:UIControlStateHighlighted];
    
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    
    [button.layer setBorderWidth:0.5f];
    
    [button.layer setCornerRadius:5.0f];
    
    [self.scrollView addSubview:button];
    
    
    button.KU_theme
    .KUAddButtonTitleColor(DAY, KUColorRGB(0, 0, 0), UIControlStateNormal)
    .KUAddButtonTitleColor(NIGHT, KUColorRGB(200, 200, 200), UIControlStateNormal)
    .KUConfigButtonTitleColor(@"ident1", UIControlStateNormal)
    .KUAddButtonImage(DAY, [UIImage imageNamed:@"true_day"], UIControlStateNormal)
    .KUAddButtonImage(NIGHT, [UIImage imageNamed:@"true_night"], UIControlStateNormal)
    .KUConfigButtonImage(@"ident4", UIControlStateNormal);
    
    button.layer.KU_theme
    .KUAddBorderColor(DAY, KUColorRGB(160, 160, 160))
    .KUAddBorderColor(NIGHT, KUColorRGB(70, 70, 70))
    .KUConfigBorderColor(@"ident2");
    
    
    // imageView
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.frame = CGRectMake(0, 240, 120, 120);
    
    imageView.center = CGPointMake(centerX, imageView.center.y);
    
    [self.scrollView addSubview:imageView];
    
    
    imageView.KU_theme
    .KUAddImage(DAY, @"image_day")
    .KUAddImage(NIGHT, @"image_night")
    .KUConfigImage(@"ident3");
    
    
    // slider
    
    UISlider *slider = [[UISlider alloc] init];
    
    slider.frame = CGRectMake(0, 380, 200, 40.0f);
    
    slider.center = CGPointMake(centerX, slider.center.y);
    
    slider.value = 0.4f;
    
    [self.scrollView addSubview:slider];
    
    
    slider.KU_theme
    .KUAddSelectorAndColor(DAY, @selector(setMinimumTrackTintColor:), KUColorRGB(33, 151, 216))
    .KUAddSelectorAndColor(NIGHT, @selector(setMinimumTrackTintColor:), KUColorRGB(28, 124, 177))
    .KUConfigKeyPathAndIdentifier(@"minimumTrackTintColor", @"ident1");
    //.KUConfigSelectorAndIdentifier(@selector(setMinimumTrackTintColor:), @"ident1");
    
    
    // switch
    
    UISwitch *switchItem = [[UISwitch alloc] initWithFrame:CGRectMake(0, 440, 120, 40.0f)];
    
    switchItem.center = CGPointMake(centerX, switchItem.center.y);
    
    [self.scrollView addSubview:switchItem];
    
    
    switchItem.KU_theme
    .KUAddOnTintColor(DAY, KUColorRGB(33, 151, 216))
    .KUAddOnTintColor(NIGHT, KUColorRGB(28, 124, 177))
    .KUConfigOnTintColor(@"ident1");
    
    
    // textfield
    
    UITextField *textfield = [[UITextField alloc] init];
    
    textfield.frame = CGRectMake(0, 500, 200, 40.0f);
    
    textfield.center = CGPointMake(centerX, textfield.center.y);
    
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    
    textfield.placeholder = @"这是一个输入框";
    
    [self.scrollView addSubview:textfield];
    
    
    textfield.KU_theme
    .KUAddBackgroundColor(DAY, KUColorRGB(255, 255, 255))
    .KUAddBackgroundColor(NIGHT, KUColorRGB(30, 30, 30))
    .KUConfigBackgroundColor(@"ident7")
    .KUAddTextColor(DAY, KUColorRGB(0, 0, 0))
    .KUAddTextColor(NIGHT, KUColorRGB(200, 200, 200))
    .KUConfigTextColor(@"ident1")
    .KUAddPlaceholderColor(DAY, KUColorRGB(200, 200, 200))
    .KUAddPlaceholderColor(NIGHT, KUColorRGB(80, 80, 80))
    .KUConfigPlaceholderColor(@"ident2")
    .KUAddCustomConfig(DAY, ^(UITextField * item) {
        
        item.keyboardAppearance = UIKeyboardAppearanceDefault;
        
        [item reloadInputViews];
    })
    .KUAddCustomConfig(NIGHT, ^(UITextField * item) {
        
        item.keyboardAppearance = UIKeyboardAppearanceDark;
        
        [item reloadInputViews];
    });
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, 560)];
}

#pragma mark - 设置主题

- (void)configTheme{
    
    self.navigationItem.rightBarButtonItem.KU_theme
    .KUAddTintColor(DAY, [UIColor blackColor])
    .KUAddTintColor(NIGHT, [UIColor whiteColor])
    .KUConfigTintColor(@"ident7");
    
    self.view.KU_theme
    .KUAddBackgroundColor(DAY , KUColorRGB(255, 255, 255))
    .KUAddBackgroundColor(NIGHT , KUColorRGB(55, 55, 55))
    .KUConfigBackgroundColor(@"ident7");
    
    // 添加方法选择器以及参数测试 可为对象添加其自定义的方法设置 并传入指定的参数
    
    self.KU_theme
    .KUThemeChangingBlock(^(NSString *tag, id item) {
        
        // 设置状态栏
        
        [item configStatusBar];
    })
    .KUAddSelectorAndValues(DAY , @selector(test:), [UIColor whiteColor] , nil)
    .KUAddSelectorAndValues(NIGHT, @selector(test:), [UIColor blackColor] , nil);
}

- (void)test:(CGColorRef)color{
    
    // 测试方法的参数类型为 CGColor , 上面设置时参数传入的为UIColor对象 , 但调用时会自动转换为CGColor类型 , CGImage也同样支持 , 如遇到不支持的类型可提Issues , 我会及时补充.
    
    NSLog(@"自定义方法测试 %@" , color);
    NSLog(@"90909090");
}

#pragma mark - 设置状态栏

- (void)configStatusBar{
    
    if ([[KUTheme currentThemeTag] isEqualToString:DAY]) {
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
        
    } else {
        
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    }
    
}

#pragma mark - 右点击事件

- (void)rightItemAction{
    
    NewThemeTableViewController *vc = [[NewThemeTableViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 单击手势事件

- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)tap{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

#pragma mark - 键盘通知事件

- (void)keyboardWillShow:(NSNotification *)notify{
    
    NSDictionary *info = [notify userInfo];
    
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGSize keyboardSize = [value CGRectValue].size;
    
    //取得键盘的动画时间，这样可以在视图上移的时候更连贯
    
    //double duration = [[notif.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0);
    
    //获取第一响应者视图
    
    UIView *firstResponderView = [self findFirstResponder:self.scrollView];
    
    if (firstResponderView) {
        
        //将第一响应者视图移动到可显示区域
        
        [self.scrollView scrollRectToVisible:firstResponderView.frame animated:YES];
    }
    
}

- (void)keyboardWillHidden:(NSNotification *)notify{
    
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - 查找第一响应者

- (UIView *)findFirstResponder:(UIView *)view{
    
    if (view.isFirstResponder) return view;
    
    for (UIView *subView in view.subviews) {
        
        UIView *firstResponder = [self findFirstResponder:subView];
        
        if (firstResponder) return firstResponder;
    }
    
    return nil;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


@end

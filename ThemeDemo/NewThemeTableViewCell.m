//
//  NewThemeTableViewCell.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "NewThemeTableViewCell.h"

@interface NewThemeTableViewCell ()

@property (nonatomic , strong ) UIView *colorView;

@property (nonatomic , strong ) UILabel *titleLabel;

@property (nonatomic , strong ) UIButton *button;

@end

@implementation NewThemeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 初始化数据
        
        [self initData];
        
        // 初始化子视图
        
        [self initSubviews];
        
        // 设置主题样式
        
        [self configTheme];
    }
    
    return self;
}

#pragma mark - 初始化数据

- (void)initData{
    
    self.selectedBackgroundView = [UIView new];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - 初始化子视图

- (void)initSubviews{
    
    _colorView = [[UIView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    
    _colorView.clipsToBounds = YES;
    
    _colorView.layer.cornerRadius = 13.0f;
    
    [self.contentView addSubview:_colorView];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 25, CGRectGetWidth([[UIScreen mainScreen] bounds]) - 80 - 80, 30)];
    
    [self.contentView addSubview:_titleLabel];
    
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _button.frame = CGRectMake(CGRectGetWidth([[UIScreen mainScreen] bounds]) - 15 - 60, 20, 60, 40);
    
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_button];
}

#pragma mark - 设置主题

- (void)configTheme{
    
    self.KU_theme
    .KUAddBackgroundColor(DAY , KUColorRGB(255, 255, 255))
    .KUAddBackgroundColor(NIGHT , KUColorRGB(55, 55, 55))
    .KUConfigBackgroundColor(@"ident7");
    
    self.selectedBackgroundView.KU_theme
    .KUAddBackgroundColor(DAY , KUColorRGB(221, 221, 221))
    .KUAddBackgroundColor(NIGHT , KUColorRGB(85, 85, 85))
    .KUConfigBackgroundColor(@"ident7");
    
    self.titleLabel.KU_theme
    .KUAddTextColor(DAY , [UIColor blackColor])
    .KUAddTextColor(NIGHT , [UIColor whiteColor])
    .KUConfigTextColor(@"ident8");
}

#pragma mark - 按钮点击事件

- (void)buttonAction:(UIButton *)sender{
    
    NSString *tag = self.info[@"tag"];
    
    NewThemeState state;
    
    if ([[KUTheme allThemeTag] containsObject:tag]) {
        
        if ([[KUTheme currentThemeTag] isEqualToString:tag]) {
            
            // 移除
            
            state = NewThemeStateRemove;
            
        } else {
            
            // 启用
            
            state = NewThemeStateStart;
        }
        
    } else {
        
        // 下载
        
        state = NewThemeStateDownload;
    }
    
    if (self.clickBlock) self.clickBlock(self ,state);
}

#pragma mark -

- (void)setInfo:(NSDictionary *)info{
    
    _info = info;
    
    self.colorView.backgroundColor = info[@"color"];
    
    self.titleLabel.text = info[@"title"];
    
    [self checkThemeState];
}

#pragma mark - 检查主题状态

- (void)checkThemeState{
    
    NSString *tag = self.info[@"tag"];
    
    if ([[KUTheme allThemeTag] containsObject:tag]) {
        
        if ([[KUTheme currentThemeTag] isEqualToString:tag]) {
            
            // 移除
            
            [self.button setTitle:@"移除" forState:UIControlStateNormal];
            
        } else {
            
            // 启用
            
            [self.button setTitle:@"启用" forState:UIControlStateNormal];
        }
        
    } else {
        
        // 下载
        
        [self.button setTitle:@"下载" forState:UIControlStateNormal];
    }
    
}



@end

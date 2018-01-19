//
//  TableViewController.m
//  ThemeDemo
//
//  Created by Mr.Jeen on 2018/1/18.
//  Copyright © 2018年 Jeen. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (nonatomic , strong ) NSMutableArray *dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 初始化数据
    
    [self initData];
    
    // 设置主题样式
    
    [self configTheme];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化数据

- (void)initData{
    
    self.navigationItem.title = @"演示Demo";
    
    if (@available(iOS 11.0, *)) {
        
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    
    self.tableView.estimatedRowHeight = 0;
    
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    self.tableView.estimatedSectionFooterHeight = 0;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _dataArray = [NSMutableArray array];
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f) {
        
        [_dataArray addObject:@"米尔社区(来自米尔军事)"];
    }
    
    [_dataArray addObject:@"新浪微博(来自YYKitDemo)"];
    
    [_dataArray addObject:@"Twitter(来自YYKitDemo)"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // 显示UINavigationBar
    
    self.navigationController.navigationBar.hidden = NO;
    
    // 判断当前主题是否为 DAY 或 NIGHT
    
    if (![[KUTheme currentThemeTag] isEqualToString:DAY] &&
        ![[KUTheme currentThemeTag] isEqualToString:NIGHT]) {
        
        [KUTheme startTheme:DAY];
    }
    
}

- (void)configTheme{
    
    self.view.KU_theme
    .KUAddBackgroundColor(DAY , KUColorRGB(255, 255, 255))
    .KUAddBackgroundColor(NIGHT , KUColorRGB(55, 55, 55));
    
    
    self.tableView.KU_theme
    .KUAddSeparatorColor(DAY , KUColorRGB(187, 187, 187))
    .KUAddSeparatorColor(NIGHT , KUColorRGB(119, 119, 119));
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

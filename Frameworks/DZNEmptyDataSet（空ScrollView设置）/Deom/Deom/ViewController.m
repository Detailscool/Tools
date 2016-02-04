//
//  ViewController.m
//  Deom
//
//  Created by pkxing on 15/8/30.
//  Copyright (c) 2015年 梦醒. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+EmptyDataSet.h"
@interface ViewController ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.emptyDataSetSource = self;
    self.tableView.emptyDataSetDelegate = self;
}

#pragma mark - DZNEmptyDataSetSource Methods
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"No Messages";
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:22.0];
    UIColor *textColor = [UIColor blackColor];
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = @"When you have messages, you’ll\nsee them here.";
    UIFont *font = [UIFont systemFontOfSize:16];
    UIColor *textColor = [UIColor grayColor];
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (paragraph) [attributes setObject:paragraph forKey:NSParagraphStyleAttributeName];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    return attributedString;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"placeholder_airbnb"];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSString *text = @"Start Browsing";
    UIFont *font = [UIFont boldSystemFontOfSize:16.0];
    UIColor *textColor = [UIColor blueColor];
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    NSLog(@"%s",__FUNCTION__);
}
@end

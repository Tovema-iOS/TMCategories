//
//  PHViewController.m
//  PHCategories
//
//  Created by linxiaobin on 03/22/2016.
//  Copyright (c) 2016 linxiaobin. All rights reserved.
//

#import "PHViewController.h"
#import <TMCategories2/TMCategories.h>

#define kSectionTitleKey @"SectionTitle"
#define kCellTitleArrayKey @"CellTitleArray"
#define kCellTitleKey @"Title"
#define kCellOperationKey @"Operation"

@interface PHViewController()

@property (nonatomic, retain) NSMutableArray *sections;

@end

@implementation PHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.sections = [NSMutableArray array];
    {
        NSMutableArray *array = [NSMutableArray array];

        typeof(self) __weak weakSelf = self;
        [array addObject:@{kCellTitleKey: @"NSString", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testString];
                               [weakSelf testURL];
                           }]}];

        [array addObject:@{kCellTitleKey: @"NSDate", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testDate];
                           }]}];

        [array addObject:@{kCellTitleKey: @"NSNotificaitonCenter", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testNotification];
                           }]}];

        [array addObject:@{kCellTitleKey: @"NSObject", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testNSObject];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UIControl", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testUIControl];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UIColor", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testUIColor];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UIImage", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testImage];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UILabel", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testLabel];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UIButton", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testUIButton];
                           }]}];

        [array addObject:@{kCellTitleKey: @"UIImageView", kCellOperationKey: [NSBlockOperation blockOperationWithBlock:^{
                               [weakSelf testUIImageView];
                           }]}];

        [self.sections addObject:@{kSectionTitleKey: @"测试",
                                   kCellTitleArrayKey: array}];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

#if 1
#warning 测试
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:5 inSection:0];
        if (indexPath.section < [self numberOfSectionsInTableView:self.tableView]
            && indexPath.row < [self tableView:self.tableView numberOfRowsInSection:indexPath.section]) {
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
            [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
        }
#endif
    });
}

- (void)testString
{
    NSString *s1 = @"我是123s";
    NSLog(@"%@ 长度为 %@", s1, @(s1.length));
    NSString *url = @"https://www.baidu.com/key=美女";
    NSLog(@"%@", url.tm_urlEncodedUTF8String);
    NSLog(@"%@", url.tm_urlEncodedUTF8String.tm_urlDecodedUTF8String);

    NSLog(@"aaa tm_compareToIgnoreCase Aaa = %@", @([@"aaa" tm_compareToIgnoreCase:@"Aaa"]));
    NSLog(@"trim %zd", [@" AA A " tm_trim].length);
}

- (void)testDate
{
    NSDate *date = [NSDate tm_dateFromString:@"2018-05-20"];
    NSLog(@"%@", date);
}

- (void)testNotification
{
    NSString *value = @"哈哈";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotificaiton:) name:@"not main" object:value];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotificaiton:) name:@"main" object:value];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotificaiton:) name:@"main wait" object:value];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"not main" object:value];
        [[NSNotificationCenter defaultCenter] tm_postNotificationNameOnMainThread:@"main" object:value];
        NSLog(@"111");
        [[NSNotificationCenter defaultCenter] tm_postNotificationNameOnMainThread:@"main wait" object:value userInfo:nil waitUntilDone:YES];
        NSLog(@"222");
    });
}

- (void)onNotificaiton:(NSNotification *)notification
{
    NSString *isMain = [NSThread currentThread].isMainThread ? @"主线程" : @"子线程";
    NSLog(@"onNotificaiton: %@, %@, %@", isMain, notification.name, notification.object);
}

- (void)testNSObject
{
    NSInteger num = 0;
    [self tm_performSelector:@selector(tableView:numberOfRowsInSection:) withObjects:@[self.tableView, @(0)] returnLoc:&num];
    NSLog(@"num = %@", @(num));
}

- (void)testURL
{
    NSString *url = @"http://www.baidu.com";
    url = [url tm_stringBySetURLValue:@"1" forKey:@"key"];
    NSLog(@"%@", url);
    url = [url tm_stringBySetURLValue:@"3" forKey:@"key2"];
    NSLog(@"%@", url);
    url = [url tm_stringBySetURLValue:@"2" forKey:@"key"];
    NSLog(@"%@", url);
    NSLog(@"%@, %@", [url tm_URLValueForKey:@"key"], [url tm_URLValueForKey:@"key2"]);
}

- (void)testUIControl
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 80, 40)];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor orangeColor]];

    [button tm_handleControlEvents:UIControlEventTouchUpInside
                          callback:^(UIButton *control) {
                              NSLog(@"tm_handleControlEvents: %@", control);
                          }];

    [self.view addSubview:button];
}

- (void)testUIColor
{
    UIColor *color = [UIColor colorWithRed:0.2 green:0.3 blue:0.5 alpha:0.5];
    NSLog(@"%f %f %f %f", color.red, color.green, color.blue, color.alpha);

    NSLog(@"%@", [color tm_RGBAComponents]);

    color = [UIColor tm_colorWithRGBHex:0x445566 alpha:0.2];
    NSLog(@"tm_colorWithRGBHex: %@, %@, %@, %@, %@", [color tm_RGBAComponents], @((float)0x44 / 255.f), @((float)0x55 / 255.f), @((float)0x66 / 255.f), @(0.2));
    NSLog(@"%@ %@", color.tm_RGBHexString, color.tm_RGBAHexString);

    color = [UIColor tm_colorWithRGBAHex:0xffffff33];
    NSLog(@"tm_colorWithRGBAHex: %@, %@", color.tm_RGBAComponents, color.tm_RGBAHexString);

    color = [UIColor tm_colorWithARGBHex:0x33ffffff];
    NSLog(@"colorWithARGBHex: %@, %@", color.tm_RGBAComponents, color.tm_RGBAHexString);

    color = [UIColor tm_colorWithRGBHexString:@"#445566" alpha:0.2];
    NSLog(@"tm_colorWithRGBHexString: %@, %@", color.tm_RGBAComponents, color.tm_RGBAHexString);

    color = [UIColor tm_colorWithRGBAHexString:@"#44556633"];
    NSLog(@"tm_colorWithRGBAHexString: %@, %@", color.tm_RGBAComponents, color.tm_RGBAHexString);

    color = [UIColor tm_colorWithARGBHexString:@"#33445566"];
    NSLog(@"tm_colorWithARGBHexString: %@, %@", color.tm_RGBAComponents, color.tm_RGBAHexString);

    NSLog(@"RGB_HEX: %@", RGB_HEX(0x445566).tm_RGBAHexString);
    NSLog(@"RGB_HEX_ALPHA: %@", RGB_HEX_ALPHA(0x445566, 0.5).tm_RGBAHexString);
    NSLog(@"RGBA_HEX: %@", RGBA_HEX(0x44556680).tm_RGBAHexString);
    NSLog(@"ARGB_HEX: %@", ARGB_HEX(0x80445566).tm_RGBAHexString);

    NSLog(@"RGB_HEX_STR: %@", RGB_HEX_STR(@"#445566").tm_RGBAHexString);
    NSLog(@"RGB_HEX_STR_ALPHA: %@", RGB_HEX_STR_ALPHA(@"#445566", 0.5).tm_RGBAHexString);
    NSLog(@"RGBA_HEX_STR: %@", RGBA_HEX_STR(@"#44556680").tm_RGBAHexString);
    NSLog(@"ARGB_HEX_STR: %@", ARGB_HEX_STR(@"#80445566").tm_RGBAHexString);
}

- (void)testImage
{
    UIImage *image = [UIImage tm_imageWithView:self.view];
    [image tm_writeToFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"1.jpg"]];
    [[image tm_scaleImageToSize:CGSizeMake(100, 200)] tm_writeToFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"2.jpg"]];
    [[UIImage tm_imageWithColor:[UIColor orangeColor] size:CGSizeMake(20, 20)] tm_writeToFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"3.jpg"]];


    [UIImage tm_downloadImage:@"http://d.hiphotos.baidu.com/image/pic/item/b17eca8065380cd79a75c52cad44ad3458828183.jpg"
                       toPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"4.jpg"]
                   completion:^(BOOL succeed) {
                       UIImage *image = [UIImage imageWithContentsOfFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"4.jpg"]];
                       [[image tm_blurImageWithBlur:0.5] tm_writeToFile:[NSTemporaryDirectory() stringByAppendingPathComponent:@"5.jpg"]];
                   }];
}

- (void)testLabel
{
    UILabel.tm_label
        .tm_frame(CGRectMake(40, 100, 80, 30))
        .tm_text(@"测试")
        .tm_font([UIFont systemFontOfSize:18])
        .tm_textColor([UIColor orangeColor])
        .tm_backgroundColor([UIColor purpleColor])
        .tm_cornerRadius(5)
        .tm_superView(self.view);
}

- (void)testUIButton
{
    UIButton.tm_button.tm_frame(CGRectMake(40, 200, 80, 40))
        .tm_normalTitle(@"测试按钮")
        .tm_normalTitleColor([UIColor orangeColor])
        .tm_backgroundColor([UIColor blueColor])
        .tm_superView(self.view);
}

- (void)testUIImageView
{
    UIImageView.tm_imageView.tm_frame(CGRectMake(40, 300, 50, 50))
        .tm_image([UIImage tm_imageWithColor:[UIColor blueColor]])
        .tm_superView(self.view);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = [self.sections objectAtIndex:section];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        return dict[kSectionTitleKey];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [self.sections objectAtIndex:section];
    if ([dict isKindOfClass:[NSDictionary class]]) {
        return [dict[kCellTitleArrayKey] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCellIDentifier" forIndexPath:indexPath];

    NSDictionary *dict = [self.sections objectAtIndex:indexPath.section];
    NSArray *titles = dict[kCellTitleArrayKey];
    if ([titles isKindOfClass:[NSArray class]]) {
        NSDictionary *cellDict = titles[indexPath.row];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd %@", indexPath.section, indexPath.row, cellDict[kCellTitleKey]];
        }
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSDictionary *dict = [self.sections objectAtIndex:indexPath.section];
    NSArray *titles = dict[kCellTitleArrayKey];
    if ([titles isKindOfClass:[NSArray class]]) {
        NSDictionary *cellDict = titles[indexPath.row];
        if ([dict isKindOfClass:[NSDictionary class]]) {
            NSBlockOperation *operation = cellDict[kCellOperationKey];
            for (void (^block)(void) in operation.executionBlocks) {
                block();
            }
        }
    }
}

@end

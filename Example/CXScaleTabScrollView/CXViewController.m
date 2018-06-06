//
//  CXViewController.m
//  CXScaleTabScrollView
//
//  Created by caixiang305621856 on 06/06/2018.
//  Copyright (c) 2018 caixiang305621856. All rights reserved.
//

#import "CXViewController.h"
#import "ZHSegmentViewController.h"
#import "UIView+ZHSegmentPostion.h"

@interface CXViewController ()

@property (nonatomic,strong)ZHSegmentViewController *segmentViewController;

@end

@implementation CXViewController

- (ZHSegmentViewController *)segmentViewController{
    if (!_segmentViewController) {
        ZHSegmentViewController *segmentViewController = [[ZHSegmentViewController alloc] init];
        [self addChildViewController:segmentViewController];
        _segmentViewController = segmentViewController;
    }
    return _segmentViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentViewController.segmentBar.frame = CGRectMake(0, 0, self.view.width, 50);
    self.segmentViewController.view.frame = CGRectMake(0, self.segmentViewController.segmentBar.height, self.view.width, self.view.height - self.segmentViewController.segmentBar.height);
    [self.view addSubview:self.segmentViewController.view];
    [self.view addSubview:self.segmentViewController.segmentBar];
    
    NSArray *items = @[@"标签1", @"标签2", @"标签3"];
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor colorWithRed:0.419 green:0.781 blue:0.977 alpha:1.000];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor colorWithRed:0.957 green:0.557 blue:0.231 alpha:1.000];
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor colorWithWhite:0.729 alpha:1.000];
    [self.segmentViewController setUpWithItems:items childViewControllers:@[vc1,vc2,vc3]];
    [self.segmentViewController.segmentBar updateWithConfig:^(ZHSegmentBarConfig *config) {
        config.itemSelectColor = [UIColor yellowColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  PublishListController.m
//  VapingTour
//
//  Created by smok on 16/8/11.
//  Copyright © 2016年 IVPS. All rights reserved.
//

#import "PublishController.h"
#import "XYMenuAnimateView.h"

@interface PublishController ()<XYMenuAnimateViewDelegate>
@property (weak, nonatomic) IBOutlet XYMenuAnimateView *buttonView;

@end

@implementation PublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.buttonView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.9];
    [self addBlurEffect];
    
    [self initSubViews];
}

- (void)initSubViews{
    NSArray *textArr = @[NSLocalizedString(@"文字",nil),NSLocalizedString(@"图片",nil),NSLocalizedString(@"视频",nil),NSLocalizedString(@"语音",nil),NSLocalizedString(@"投票",nil),NSLocalizedString(@"签到",nil),];
    NSMutableArray *imgArr = [NSMutableArray array];
    for (int i = 0; i<textArr.count; i++) {
        NSString *imageName = [NSString stringWithFormat:@"publish_%d",i];
        [imgArr addObject:imageName];
    }
    self.buttonView.textArray = textArr;
    self.buttonView.imageNameArray = imgArr;
    self.buttonView.delegate = self;
    [self.buttonView show];
}

- (IBAction)exitControllerAction:(id)sender {
    [self.buttonView close:^{
       [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)menuAnimateViewButton:(UIButton *)button andIndex:(NSInteger)index {
    NSLog(@"%ld",(long)index);
}

- (void)addBlurEffect {
     UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
     UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
     effectView.frame = self.view.bounds;
//     effectView.alpha = 0.8;
     [self.view addSubview:effectView];
     [self.view sendSubviewToBack:effectView];
}

@end

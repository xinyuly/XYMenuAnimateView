//
//  XYMenuAnimateView.m
//  XYMenuAnimateView
//
//  Created by lixinyu on 16/8/14.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "XYMenuAnimateView.h"

@interface XYButton : UIButton
@end
@implementation XYButton
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat magre = 8;
    CGFloat imgW = self.imageView.frame.size.width;
    CGFloat imgH = self.imageView.frame.size.height;
    CGFloat imgX = (self.frame.size.width-imgW)*0.5;
    self.imageView.frame = CGRectMake(imgX, 0, imgW, imgH);
    CGFloat titleH = self.titleLabel.frame.size.height;
    self.titleLabel.frame = CGRectMake(0, imgH+magre, self.frame.size.width, titleH);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}
@end

@implementation XYMenuAnimateView

- (void)show {
    int columnCount= self.columnCount?self.columnCount:3;
    CGFloat width = self.frame.size.width/columnCount;
    CGFloat edge = 0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i<self.imageNameArray.count; i++) {
            int row=i/columnCount;
            int loc=i%columnCount;
            XYButton *button = [[XYButton alloc] init];
            button.frame = CGRectMake(edge+(edge+width)*loc, 615+edge+(edge+width-10)*row, width, width);
            [self addSubview:button];
            NSString *imageName = self.imageNameArray[i];
            UIImage *image = [UIImage imageNamed:imageName];
            [button setImage:image forState:UIControlStateNormal];
            if (self.textArray) {
                [button setTitle:self.textArray[i] forState:UIControlStateNormal];
            }
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            //动画方式一：UIView 0.6 0.05
            [UIView animateWithDuration:0.5 delay:i*0.03 usingSpringWithDamping:0.7 initialSpringVelocity:0.05 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                
                button.frame  = CGRectMake(edge+(edge+width)*loc, 15+edge+(width+20)*row, width, width);
                NSLog(@"%@",NSStringFromCGRect(button.frame));
            } completion:^(BOOL finished) {
            }];
            //动画方式二：
            //        CABasicAnimation *positionAnimation;
            //        positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        }
    });
}


- (void)buttonAction:(XYButton*)button {
    NSInteger index = button.tag;
    if ([self.delegate respondsToSelector:@selector(menuAnimateViewButton:andIndex:)]) {
        [self.delegate menuAnimateViewButton:button andIndex:index];
    }
}

- (void)close:(void(^)())completion{
    CGFloat dy = CGRectGetHeight(self.frame) + 70;
    for (int i = 0; i<self.imageNameArray.count; i++) {
        XYButton *button = self.subviews[i];
        CGFloat width = CGRectGetWidth(button.frame);
        CGFloat buttonX = button.frame.origin.x;//0.3-i*0.03
        [UIView animateWithDuration:0.3 delay:0.03*self.imageNameArray.count-i*0.03 usingSpringWithDamping:0.7 initialSpringVelocity:0.04 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.frame  = CGRectMake(buttonX, dy, width, width);
        } completion:^(BOOL finished) {
            completion();
            [button removeFromSuperview];
        }];
    }
}
@end

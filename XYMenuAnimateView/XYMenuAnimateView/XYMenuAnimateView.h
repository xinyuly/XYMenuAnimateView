//
//  XYMenuAnimateView.h
//  XYMenuAnimateView
//
//  Created by lixinyu on 16/8/14.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYMenuAnimateViewDelegate <NSObject>
- (void)menuAnimateViewButton:(UIButton *)button andIndex:(NSInteger)index;
@end

@interface XYMenuAnimateView : UIView
@property (nonatomic, assign) int columnCount;//默认每行3个
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSArray<NSString *> *imageNameArray;
@property (nonatomic, weak)   id<XYMenuAnimateViewDelegate>delegate;
- (void)show;
- (void)close:(void(^)())completion;

@end

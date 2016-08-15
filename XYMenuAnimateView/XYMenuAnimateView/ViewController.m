//
//  ViewController.m
//  XYMenuAnimateView
//
//  Created by lixinyu on 16/8/14.
//  Copyright © 2016年 xiaoyu. All rights reserved.
//

#import "ViewController.h"
#import "PublishController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}


- (IBAction)publishAction:(id)sender {
    PublishController *controller = [[PublishController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:controller animated:NO completion:nil];
}

@end

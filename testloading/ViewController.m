//
//  ViewController.m
//  testloading
//
//  Created by cloud on 6/21/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
@interface ViewController ()
@property (strong, nonatomic) LoadingView* loadingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoadingView* loadingView = [[LoadingView alloc]init];
    loadingView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    [self.view addSubview:loadingView];
    self.loadingView = loadingView;
    [self.loadingView start];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

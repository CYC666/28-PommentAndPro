//
//  ViewController.m
//  PommentAndPro
//
//  Created by mac on 16/12/9.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "ViewController.h"
#import "CCommentPro.h"

@interface ViewController () {

    CCommentPro *_com;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
    
    [_com lose];
    
    
}

- (IBAction)comment:(UIButton *)sender {
    
    CGRect rect = sender.frame;
    
    _com = [[CCommentPro alloc] initWithFrame:CGRectMake(rect.origin.x - 100, rect.origin.y, 0, 0) state:YES];
    [self.view addSubview:_com];
    
    
}

@end

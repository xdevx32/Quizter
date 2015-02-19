//
//  LoginViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 10/25/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface LoginViewController ()<FBLoginViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FBLoginView *loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(50, 400, 150, 200)];
    loginView.delegate = self;
    [self.view addSubview:loginView];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

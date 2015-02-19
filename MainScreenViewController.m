//
//  MainScreenViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 10/23/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "MainScreenViewController.h"
#import "ViewController.h"
#import "DataClass.h"

@interface MainScreenViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation MainScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSDictionary *theValues = [NSDictionary dictionaryWithDictionary:[_myJSON valueForKey:@"userInfo"]];
    
    DataClass *obj=[DataClass getInstance];
    obj.str= @"I am Global variable.How are you ?";
    
    self.userImage.layer.cornerRadius = self.userImage.frame.size.height /2;
    self.userImage.layer.masksToBounds = YES;
    self.userImage.layer.borderWidth = 0;
    
    _playerLabel.text = [NSString stringWithFormat:@"%@",obj.globalName];
    //modifying credits label
    self.creditsLabel.layer.borderColor = [UIColor grayColor].CGColor;
    _creditsLabel.layer.borderWidth = 2.0;
    _creditsLabel.layer.cornerRadius = 15;
    [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", (int)obj.credits]];
    // modifying points label
    self.pointsLabel.layer.borderColor = [UIColor grayColor].CGColor;
    self.pointsLabel.layer.borderWidth = 2.0;
    self.pointsLabel.layer.cornerRadius = 15;
    [_pointsLabel setText:[NSString stringWithFormat:@"%i POINTS",(int)obj.points]];
    
}

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

- (IBAction)logout:(id)sender {
    // giving incorrect session values
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"SessionKey"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"usernameKey"];
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"passwordKey"];

    [self performSegueWithIdentifier:@"logout" sender:self];
}
@end

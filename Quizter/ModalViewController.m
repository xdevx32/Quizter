//
//  ModalViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 11/7/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Simple gesture recognizer for Swipe left
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    // Do any additional setup after loading the view.
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dismiss:(UIGestureRecognizer*)gesture {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
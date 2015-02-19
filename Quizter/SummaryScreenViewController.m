//
//  SummaryScreenViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 11/3/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "SummaryScreenViewController.h"
#import "DataClass.h"

@interface SummaryScreenViewController ()

@end

@implementation SummaryScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DataClass *obj=[DataClass getInstance];
    self.allQuestionsLabel.text = [NSString stringWithFormat:@"Questions: %i",(unsigned)obj.questionsCount];
    self.correctQuestionsLabel.text = [NSString stringWithFormat:@"Correct: %i",(unsigned)obj.correctQuestionsCount];
    self.wrongQuestionsLabel.text = [NSString stringWithFormat:@"Wrong: %i",(unsigned)obj.wrongQuestionsCount];
    // Do any additional setup after loading the view.
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

@end

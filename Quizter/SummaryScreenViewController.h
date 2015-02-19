//
//  SummaryScreenViewController.h
//  Quizter
//
//  Created by Angel Kukushev on 11/3/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataClass.h"

@interface SummaryScreenViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *allQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *correctQuestionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *wrongQuestionsLabel;

@end

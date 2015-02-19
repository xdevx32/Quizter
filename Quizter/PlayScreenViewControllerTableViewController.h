//
//  PlayScreenViewControllerTableViewController.h
//  Quizter
//
//  Created by Angel Kukushev on 10/28/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DataClass.h"

@interface PlayScreenViewControllerTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *timerDigit;
@property (weak, nonatomic) IBOutlet UILabel *questionTextLabel;
@property (retain, nonatomic) IBOutletCollection(UILabel) NSArray *smallLabels;
@property (weak, nonatomic) IBOutlet UILabel *creditsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
- (IBAction)answerButtonPressed:(id)sender;
- (IBAction)jokerButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ansLabelA;
@property (weak, nonatomic) IBOutlet UIButton *ansLabelB;
@property (weak, nonatomic) IBOutlet UIButton *ansLabelC;
@property (weak, nonatomic) IBOutlet UIButton *ansLabelD;


@end

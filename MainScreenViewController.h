//
//  MainScreenViewController.h
//  Quizter
//
//  Created by Angel Kukushev on 10/23/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface MainScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *playerLabel;
@property (weak, nonatomic) IBOutlet UILabel *creditsLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;

- (IBAction)logout:(id)sender;

@end

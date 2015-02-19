//
//  ViewController.h
//  Quizter
//
//  Created by Angel Kukushev on 10/7/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenViewController.h"

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *facebookProfilePicture;

@property (strong, nonatomic)NSDictionary *validJsonData;

@property (weak, nonatomic) IBOutlet UILabel *credits;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *middleName;
@property (weak, nonatomic) IBOutlet UILabel *lastName;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *birthday;
@property (weak, nonatomic) IBOutlet UILabel *link;

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

- (NSString *) md5:(NSString *) input;


@end


//
//  LoginViewController.h
//  Ribbit
//
//  Created by Angel Kukushev on 8/18/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface LoginViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;
//#pragma mark POST METHODS
//
// -(void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data;
// -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
// -(void)connectionDidFinishLoading:(NSURLConnection *)connection;
@end

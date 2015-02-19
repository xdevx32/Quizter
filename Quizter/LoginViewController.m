//
//  LoginViewController.m
//  Ribbit
//
//  Created by Angel Kukushev on 8/18/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface LoginViewController ()

@end

@implementation LoginViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FBLoginView *loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(50, 400, 150, 200)];
    //loginView.center = self.view.center;
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.hidesBackButton = YES;
    
    
    callPostURL(self);
    
}

- (IBAction)login:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if( [username length] == 0 || [password length] == 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
//    else{
//        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
//            if(error){
//                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [alertView show];
//            }
//            else{
//                [self.navigationController popToRootViewControllerAnimated:YES];
//            }
//        }];
//                                                                 
//        }
//
    
}

void callPostURL(LoginViewController *object)
{
    // object is self
    //Post request attempt
    NSString *post = [NSString stringWithFormat:@"&Username=%@&Password=%@",@"angel",@"test"];
    
    
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init]; // i deleted ] autorelease];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://quizter.me/api/test.php"]]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
   
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:object];
    if(conn)
    {
        NSLog(@"Connection Successful");
    }
    else
    {
        NSLog(@"Connection could not be made");
    }
    
    // API CALL
//    [FBRequestConnection startWithGraphPath:@"/v1.0/me"
//                                 parameters:nil
//                                 HTTPMethod:@"POST"
//                          completionHandler:^(
//                                              FBRequestConnection *connection,
//                                              id result,
//                                              NSError *error
//                                              ) {
//                              /* handle the result */
//                          }];
//    
    ///
    /* make the API call */
    [FBRequestConnection startWithGraphPath:@"/me"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                          }];
    
    
    ///
    //additional
    // crashes right here
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&jsonParsingError];
    
   // NSArray *publicTimeline = [NSJSONSerialization JSONObjectWithData:response
                                                         //     options:0 error:&jsonParsingError];
  //  NSDictionary *nameAgeMailDictionary;
    
    NSLog(@"Response is: %@",json);
    
    
    
    
    /// end
    
    NSLog(@"%@",[object md5:@"angel"]);
    
    
    
   
}




@end

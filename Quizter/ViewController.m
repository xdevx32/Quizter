//
//  ViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 10/7/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "MainScreenViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <CommonCrypto/CommonDigest.h>
#import "DataClass.h"
#import <Foundation/Foundation.h>


@interface ViewController()<FBLoginViewDelegate>

@end

BOOL loginInformationMatches = true;
DataClass *object;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FBLoginView *loginView = [[FBLoginView alloc] initWithFrame:CGRectMake(50, 400, 150, 200)];
    loginView.delegate = self;
    [self.view addSubview:loginView];
    object = [DataClass getInstance];
    
    if( [[[NSUserDefaults standardUserDefaults] stringForKey:@"SessionKey"]  isEqual: @"ASDQWEZXC"]){
        [self performSegueWithIdentifier:@"toMainScreen" sender:self];
        NSString *url = @"http://quizter.me/api/users.php";
        NSString *phpCmd = [NSString stringWithFormat:@"?&cmd=getUserDetails&userFK=%i",[[[NSUserDefaults standardUserDefaults] stringForKey:@"userIDKey"]intValue]]; // real id token from session stays here
        [DataClass callPostURLGlobal:url username:@"" password:@"" command:phpCmd];
        //getParams
        url = @"http://quizter.me/api/global.php";
        phpCmd = @"?&cmd=getParams";
        [DataClass callPostURLGlobal:url username:@"" password:@"" command:phpCmd];
        // old call
        //[self callPostURL:url postName:username postPassword:password];
        //end of request

    }
}

#pragma mark - Login methods

- (IBAction)login:(id)sender {
    
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // login request
    NSString *url = @"http://quizter.me/api/users.php";
    NSString *cmdLoginPHP = @"?&cmd=doLogin&username=%@&password=%@";
    // NSString *cmdLoginPHP = @"?cmd=doLogin&username=%@&password=%@",username,password];
    //old call
    //[self callPostURL:url postName:username postPassword:password];
    
    
    NSDictionary *loginJSON = [DataClass callPostURLGlobal:url username:username password:password command:cmdLoginPHP];
   // username and password correct check
    // this thing gives me the 0 or 1 from the json.. which is all i need for check if username/pass is correct !!!
    //
    //
    //    bool usernameAndPasswordAreCorrect = true;
    NSLog(@"THE ERROR VALUE SHOULD BE 0 , but it really is.. : %@",[loginJSON valueForKey:@"error"]);
    BOOL errorValue = [[loginJSON valueForKey:@"error"]boolValue];
    
    // CHECK
    
    // ask the user if he wants to remember username and password
    
    if(!errorValue){
        loginInformationMatches = false;
        // creating user session key
        //i should add a checkmark which asks the user if he wants a session
        [[NSUserDefaults standardUserDefaults] setValue:@"ASDQWEZXC" forKey:@"SessionKey"];
        [[NSUserDefaults standardUserDefaults] setValue:username forKey:@"usernameKey"];
        [[NSUserDefaults standardUserDefaults] setValue:password forKey:@"passwordKey"];
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%i",(int)object.userID]forKey:@"userIDKey"];
        NSLog(@"A user session was just created.");
        
        // Reading the Key
        //[[NSUserDefaults standardUserDefaults] stringForKey:@"SessionKey"];
        
        NSLog(@"User ID Key is : %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userIDKey"]);
        
    }else if(errorValue){
        loginInformationMatches = true;
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error." message:@"Wrong username or password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }else{
        NSLog(@"Error...");
    }
    
    
    //end of request
    if( [username length] == 0 || [password length] == 0){
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Make sure you enter a username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
       
       //handling session
       // Saving the Key
    //handle the session

    //}
    
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
    [self viewDidLoad];
}

#pragma mark - additional functions

- (NSString *) md5:(NSString *) input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (int)strlen(cStr), digest ); // This is the md5 call i manually casted it to (int) ... without this gives an error
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
    
}
//#pragma mark - Facebook name methods
//
//- (void) getFacebookName {
//    
//    [facebook requestWithGraphPath:@"me?fields=id,name" andDelegate:self];
//}
//
//#pragma mark - FBRequestDelegate methods
//
//- (void)request:(FBRequest *)request didLoad:(id)result {
//    
//    NSLog(@"Result: %@", result);
//    NSDictionary *userInfo = (NSDictionary *)result;
//    userName = [userInfo objectForKey:@"name"];
//    fb_id = [userInfo objectForKey:@"id"];
//}

// make the function get the url as an argument
//


#pragma mark - callPostFunction and else

- (void)apiCall {
    
    /* make the API call */
    [FBRequestConnection startWithGraphPath:@"/v2.1/me"
                                 parameters:nil
                                 HTTPMethod:@"POST"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                          }];
}





#pragma mark - FBLoginViewDelegate

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    NSLog(@"LOGGED IN");
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    NSLog(@"LOGGED OUT");
    self.name.text = nil;
    self.middleName.text = nil;
    self.lastName.text = nil;
    self.identifier.text = nil;
    self.username.text = nil;
    self.birthday.text = nil;
    self.link.text = nil;
}

- (void)placeFacebookPic:(NSString *)userImageURL
{
    //placing the picture
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userImageURL]];
    _facebookProfilePicture.image = [UIImage imageWithData:imageData];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:userImageURL]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        _facebookProfilePicture.image = [UIImage imageWithData:data];
    }];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    // assigns facebook information when user is logged
    self.name.text = user.first_name;
    self.middleName.text = user.middle_name;
    self.lastName.text = user.last_name;
    self.identifier.text = user.objectID; // i should fix this
    self.username.text = user.username;
    self.birthday.text = user.birthday;
    self.link.text = user.link;
    
    
    // request ing picture using graph and placing it ... has nslog with username and url too
    
    
    [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *FBuser, NSError *error) {
        if (error) {
            // Handle error
            NSLog(@"Error");
        }
        
        else {
            NSString *userName = [FBuser name];
            NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [FBuser objectID]];
            
            
            NSLog(@"%@ %@",userName,userImageURL);
            
           // [self placeFacebookPic:userImageURL];
            
        }
    }];
    
    
    
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    NSLog(@"OPS, FaceBook Login encountered an error --> %@" ,error);
}

// this will be useful for facebook session


//- (IBAction)buttonTouched:(id)sender
//{
//    // If the session state is any of the two "open" states when the button is clicked
//    if (FBSession.activeSession.state == FBSessionStateOpen
//        || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
//
//        // Close the session and remove the access token from the cache
//        // The session state handler (in the app delegate) will be called automatically
//        [FBSession.activeSession closeAndClearTokenInformation];
//
//        // If the session state is not any of the two "open" states when the button is clicked
//    } else {
//        // Open a session showing the user the login UI
//        // You must ALWAYS ask for public_profile permissions when opening a session
//        [FBSession openActiveSessionWithReadPermissions:@[@"public_profile"]
//                                           allowLoginUI:YES
//                                      completionHandler:
//         ^(FBSession *session, FBSessionState state, NSError *error) {
//
//             // Retrieve the app delegate
//             AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
//             // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
//             [appDelegate sessionStateChanged:session state:state error:error];
//         }];
//    }
//}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"toMainScreen"]) {
        //Check if should make the segue
        //if not do something
        if(loginInformationMatches == false){
            
            
            
           // MainScreenViewController *secondViewController = [[MainScreenViewController alloc] init];
        [self performSegueWithIdentifier:@"toMainScreen" sender:self];
        }
        //and return NO;
        return NO;
    }
    return YES;
}


@end

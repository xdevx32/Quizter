//
//  DataClass.m
//  Quizter
//
//  Created by Angel Kukushev on 10/27/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//
// it would be a good idea to keep all this in a json, dictionary or array or something..
//for organisation purposes only
//or maybe some improvements

#import "DataClass.h"

@implementation DataClass
@synthesize str;
@synthesize credits;
@synthesize points;
@synthesize userID;
@synthesize globalName;
@synthesize globalFullName;
@synthesize questionsCount;
@synthesize currentQuestionsArray;
@synthesize wrongQuestionsCount;
@synthesize correctQuestionsCount;
@synthesize itsTimeForButtonPressedBooleanValue;
@synthesize priceSwitch,price5050,priceAudience,priceDd;


static DataClass *instance = nil;

+(DataClass *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [DataClass new];
        }
    }
    return instance;
}

//+(NSString*)callPostURLGlobal{
//    NSLog(@"test");
//    return @"horray";
//}
// trying to edit the function


+ (NSString *)callPostURLGlobal:(NSString*)url username:(NSString*)arg1 password:(NSString*)arg2 command:(NSString*)arg3{
    DataClass *myObject = [DataClass getInstance];
    NSString *post = [NSString stringWithFormat:arg3,arg1,arg2];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:NO];
   // NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
    [request setHTTPBody:postData];
    
    NSURLConnection *conn = [[NSURLConnection alloc]initWithRequest:request delegate:self];
    if(conn)
    {
        NSLog(@"Connection Successful");
    }
    else
    {
        NSLog(@"Connection could not be made");
    }
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil error:nil];
    NSError *jsonParsingError = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&jsonParsingError];
    //NSDictionary *theValues = [NSDictionary dictionaryWithDictionary:[json valueForKey:@"userInfo"]];
   
   // NSLog(@"JSON theValues (the response of a child dictionary): %@",theValues);
    
   NSLog(@"ERROR (must be 0 for correct user input) : %@",[json valueForKey:@"error"]);
    
#pragma mark - Conditionals in exact request
    
    if([post isEqualToString:[NSString stringWithFormat:@"?&cmd=doLogin&username=%@&password=%@",arg1,arg2]] || [post isEqualToString:[NSString stringWithFormat:@"?&cmd=getUserDetails&userFK=1"]]){
        DataClass *obj=[DataClass getInstance];
        obj.userID = [[json objectForKey:@"id"]longValue];
        NSLog(@"%l",obj.userID);
        //should store this for NSUserDefaults and log in with the exact ID
        //should also not make second request to server if autoLogin is ON . :)
        
        obj.globalName= [json objectForKey:@"username"];
        obj.globalFullName =[json objectForKey:@"full_name"];
        obj.credits = [[json objectForKey:@"credits"]intValue];
        obj.points = [[json objectForKey:@"points"]intValue];
    }

    if([arg3 isEqualToString:[NSString stringWithFormat:@"?&cmd=getQuestions&userFK=%i",myObject.userID]]){
        DataClass *tinyObject = [DataClass getInstance];
        NSError *error;
        NSDictionary *jsonTwo = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
       //this is the array with all questions from the request.
        // current question will be
        NSArray *fetchedArr = [jsonTwo objectForKey:@"questions"];
        tinyObject.currentQuestionsArray = fetchedArr;
        // tests
        //        NSString *testDisplayStringWithALongName ;
        //        for (int i=0; i<[fetchedArr count]; i++) {
        //            NSLog(@"%d: %@", i, fetchedArr[i]);
        //        }
        //NSDictionary *questionsArray = [NSDictionary dictionaryWithDictionary:[json valueForKey:@"10 objects"]];
        NSString *questionsJsonIAMGETTINGANGRYAROUNDTHIS = [NSString stringWithFormat:@"%@",jsonTwo ];
//        int i;
//        for(i = 0;i<questionsJsonIAMGETTINGANGRYAROUNDTHIS.length;i++){
//            while(questionsJsonIAMGETTINGANGRYAROUNDTHIS[i] != @";"){
//                NSLog
//            }
//        }
        //NSLog(@"%@",questionsFormated);

        NSLog(@"%@",questionsJsonIAMGETTINGANGRYAROUNDTHIS);
        NSLog(@"ANGRYYYYYY : %@",questionsJsonIAMGETTINGANGRYAROUNDTHIS);
        NSArray *questionsTest = [NSArray arrayWithObjects:[json valueForKey:@"questions"], nil];
        NSArray *questionsTest1 = [NSArray arrayWithObjects:[questionsTest valueForKey:@"10 objects"], nil];
        //     NSString *jsonString = [NSString stringWithFormat:questionsTest1];
        //    NSLog(jsonString);
        NSLog(@"TEST 1 : %@" , questionsTest1);
        NSLog(@"question test output: %@",questionsTest);
        //
        [questionsTest enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
            NSLog (@"object->%@",object);
        }];
        
        //    [questionsTest enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop){
        //        NSLog(@"key->%@, value-> %@",key,object);
        //    }];
        //http://quizter.me/api/questions.php?&cmd=getQuestions&userFK=1
        
        
//        for (id obj in questionsTest)
//            NSLog(@"obj: %@", obj);
//        int i;
//        for (i = 0; i < [questionsTest1 count]; i++) {
//            id myArrayElement = [questionsTest1 objectAtIndex:i];
//            NSLog(@" Element %i is :%@",i,myArrayElement);
//        }

    }
    if([arg3 isEqualToString:@"?&cmd=getParams"]){
        // set prices for jokers in global vars
        NSDictionary *jokerPrices = [NSDictionary dictionaryWithDictionary:[[json valueForKey:@"params"] valueForKey:@"prices"]];
        NSLog(@"Joker prices: %@",jokerPrices);
        myObject.priceSwitch = [[jokerPrices valueForKey:@"ll_switch"]intValue];
        myObject.priceAudience = [[jokerPrices valueForKey:@"ll_audience"]intValue];
        myObject.priceDd = [[jokerPrices valueForKey:@"ll_dd"]intValue];
        myObject.price5050 = [[jokerPrices valueForKey:@"ll_50-50"]intValue];
        
    }
    //tests
    NSLog(@"URL: %@ CMD: %@",url,post);
    NSLog(@"Response: %@",json); //should put name of command and url to check before
    NSLog(@"Error: %@",[json valueForKey:@"error"]);
    NSLog(@"Email: %@",json[@"email"]);
    // also works with [theValues objectForKey:@"email"]

    myObject.itsTimeForButtonPressedBooleanValue = false;
    return json;
}




@end

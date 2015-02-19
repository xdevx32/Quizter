//
//  DataClass.h
//  Quizter
//
//  Created by Angel Kukushev on 10/27/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "MainScreenViewController.h"
#import "PlayScreenViewControllerTableViewController.h"

@interface DataClass : NSObject {
    
    NSArray *currentQuestionsArray;
    NSString *str;
    NSInteger *credits;
    NSInteger *points; // it was added here like that before : @",*userID";
    long *userID;
    unsigned *questionsCount;
    unsigned *correctQuestionsCount;
    unsigned *wrongQuestionsCount;
    NSString *globalName,*globalFullName;
    bool *itsTimeForButtonPressedBooleanValue;  // so fluent... it's when it goes for requests
    int *priceAudience,*priceDd,*priceSwitch,*price5050;
}

@property(nonatomic,retain)NSArray *currentQuestionsArray;
@property(nonatomic)NSInteger *points;
@property(nonatomic)NSInteger *credits;
@property(nonatomic)long *userID;
@property(nonatomic,retain)NSString *str;
@property(nonatomic,retain)NSString *globalFullName;
@property(nonatomic,retain)NSString *globalName;
@property(nonatomic)unsigned *questionsCount;
@property(nonatomic)unsigned *correctQuestionsCount;
@property(nonatomic)unsigned *wrongQuestionsCount;
@property(nonatomic)bool *itsTimeForButtonPressedBooleanValue;
@property(nonatomic)int *priceAudience,*priceDd,*priceSwitch,*price5050;

+(DataClass*)getInstance;
+ (NSString *)callPostURLGlobal:(NSString*)url username:(NSString*)arg1 password:(NSString*)arg2 command:(NSString*)arg3;
@end

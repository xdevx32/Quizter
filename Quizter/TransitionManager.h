//
//  TransitionManager.h
//  Quizter
//
//  Created by Angel Kukushev on 11/7/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//


#import <Foundation/Foundation.h>

//Define a custom type for the transition mode
//It simply says which is the current showed view...
typedef NS_ENUM(NSUInteger, TransitionStep){
    INITIAL = 0,
    MODAL
};

@interface TransitionManager : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) TransitionStep transitionTo;

@end
//
//  PlayScreenViewControllerTableViewController.m
//  Quizter
//
//  Created by Angel Kukushev on 10/28/14.
//  Copyright (c) 2014 Cranial Ink. All rights reserved.
//

#import "PlayScreenViewControllerTableViewController.h"
#import "DataClass.h"
#import "AppDelegate.h"

@interface PlayScreenViewControllerTableViewController (){
    
    NSMutableArray *ddAnswers;
    int localCredits,localPoints;
    int duration;
    int currentQuestionID;
    CGFloat startAngle;
    CGFloat endAngle;
    NSTimer *timer;
    CAShapeLayer *circle;
    NSArray *questionsArray;
    unsigned questionCount1,correctQuestionsCount1,wrongQuestionsCount1;
    DataClass *object;
    NSString *url,*cmd;
    bool doubleDipBool,doubleDipBool2;
    NSDictionary *currentQuestionUsefulVariable;
}

@end

@implementation PlayScreenViewControllerTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    questionsArray = nil;
   ddAnswers = [NSMutableArray new];
    object=[DataClass getInstance];
    _timerDigit.textColor = [UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:1];
    _timerDigit.text = [NSString stringWithFormat:@"NEXT!"];
    localCredits = (int)object.credits;
    localPoints = (int)object.points;
    questionCount1 = 0;
    //[self setQuestionTextLabel];
 //   _questionTextLabel.text = questionsArray[questionCount1];
    [self drawCircleWithTImer];
    //[self timerFunc];
    duration = 11;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];

    //modifying credits label
    self.creditsLabel.layer.borderColor = [UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:1].CGColor;
    _creditsLabel.layer.borderWidth = 2.0;
    _creditsLabel.layer.cornerRadius = 15;
    [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", localCredits]];
    // modifying points label
    self.pointsLabel.layer.borderColor = [UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:1].CGColor;
    self.pointsLabel.layer.borderWidth = 2.0;
    self.pointsLabel.layer.cornerRadius = 15;
    [_pointsLabel setText:[NSString stringWithFormat:@"%i POINTS",(int)object.points]];
    
    [self getQuestions];
    

    
    
    [self setQuestionsAndAnswersRandom];
    //    [_ansLabelA setTitle: [currentQuestionUsefulVariable valueForKey:@"a1"] forState: UIControlStateNormal];
//    [_ansLabelB setTitle: [currentQuestionUsefulVariable valueForKey:@"a2"] forState: UIControlStateNormal];
//    [_ansLabelC setTitle: [currentQuestionUsefulVariable valueForKey:@"a3"] forState: UIControlStateNormal];
//    [_ansLabelD setTitle: [currentQuestionUsefulVariable valueForKey:@"a4"] forState: UIControlStateNormal];
//    _questionTextLabel.text = [currentQuestionUsefulVariable valueForKey:@"q"];
    //recieve answer task
//questioncount++ was here and ruining everything
    //setting question label, answer labels too
//    
//    [_ansLabelA setTitle: [currentQuestionUsefulVariable valueForKey:@"a1"] forState: UIControlStateNormal];
//    [_ansLabelB setTitle: [currentQuestionUsefulVariable valueForKey:@"a2"] forState: UIControlStateNormal];
//    [_ansLabelC setTitle: [currentQuestionUsefulVariable valueForKey:@"a3"] forState: UIControlStateNormal];
//    [_ansLabelD setTitle: [currentQuestionUsefulVariable valueForKey:@"a4"] forState: UIControlStateNormal];
//    _questionTextLabel.text = [currentQuestionUsefulVariable valueForKey:@"q"];
    //
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getQuestions {
    if(true){
        
        url = @"http://quizter.me/api/questions.php";
        cmd = [NSString stringWithFormat:@"?&cmd=getQuestions&userFK=%i",(int)object.userID]; // %@ is for user ID
        [DataClass callPostURLGlobal:url username:@"" password:@"" command:cmd];
    }
}

//-(void)setQuestionTextLabel{
//    
//    questionsArray = @[@"Which of these countries was invaded by Germany on September 1, 1939 , thus unleashning WWII ?",
//                       @"I am showing question number two. This is a test question. How are you doing today ?",
//                       @"I am showing question number three. This is a test question.",
//                       @"I am showing question number four. This is a test question.",
//                       @"Stoyan drives 300 m/h on the highway to Plovdiv.He gets pulled over by cops and he shits his pants.",
//                       @"Todor Bobev have a great sense of humor.Really.Awesome.You should ask him for a joke.He has green jeans.",
//                       @"Georgi Chelev gets drunk so fast.",
//                       @"What time did you wake up ?",
//                       @"Foo 2",
//                       @"Last question",
//                       @""];
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Answer, timer and drawCircle methods

- (void)setQuestionsAndAnswersRandom {
    if(questionCount1 < 10){
    self->currentQuestionUsefulVariable = object.currentQuestionsArray[questionCount1];
    }
    NSArray *myarcConfigurations = @[@"a4,a2,a1,a3", @"a1,a2,a3,a4", @"a4,a1,a3,a2",@"a3,a2,a4,a1",
                                     @"a1,a3,a2,a4",@"a4,a2,a1,a3",@"a4,a1,a3,a2",@"a3,a2,a1,a4", @"a2,a1,a4,a3", @"a4,a1,a2,a3"];
    int random = arc4random_uniform(10);
    NSLog(@"%i",random);
    NSString *currentConfig = myarcConfigurations[random];
    NSString * ans1 = [currentConfig substringWithRange:NSMakeRange(0, 2)];
    NSString * ans2 = [currentConfig substringWithRange:NSMakeRange(3, 2)];
    NSString * ans3 = [currentConfig substringWithRange:NSMakeRange(6, 2)];
    NSString * ans4 = [currentConfig substringWithRange:NSMakeRange(9,2)];
    currentQuestionID = [[currentQuestionUsefulVariable valueForKey: @"id"]intValue];
    [_ansLabelA setTitle: [currentQuestionUsefulVariable valueForKey: ans1] forState:UIControlStateNormal];
    [_ansLabelB setTitle: [currentQuestionUsefulVariable valueForKey:ans2] forState:     UIControlStateNormal];
    [_ansLabelC setTitle: [currentQuestionUsefulVariable valueForKey:ans3] forState: UIControlStateNormal];
    [_ansLabelD setTitle: [currentQuestionUsefulVariable valueForKey:ans4] forState: UIControlStateNormal];
    //    if( ( questionCount1 % 2 == 0 && questionCount1 < 5) )
    //put them in the for loop
    _questionTextLabel.text = [currentQuestionUsefulVariable valueForKey:@"q"];
    [_questionTextLabel setFont:[UIFont fontWithName:@"Arial" size:15.0]];
}

- (IBAction)answerButtonPressed:(id)sender {
    if(doubleDipBool == true){
        [ddAnswers addObject:[[sender titleLabel] text]];
        doubleDipBool = false;
    }
    else{
    [timer invalidate];
    // if 5050 joker pressed
    [_ansLabelC setAlpha:(1.0)];
    [_ansLabelD setAlpha:(1.0)];
    //if dd joker pressed
    // if answer1 or answer 2 is equal to a1 - > answer = a1
    //
    [self->circle removeFromSuperlayer];
    _timerDigit.textColor = [UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:1];
     _timerDigit.text = [NSString stringWithFormat:@"NEXT!"];
     duration = 11;
    //setting label text for the four answers
    //UILabel *questionLabel = (UILabel *) [self.view viewWithTag:(int)obj.questionsCount + 1];
    UILabel *questionLabel = (UILabel *) [self.view viewWithTag:questionCount1 + 1];
    NSString* answer= [[sender titleLabel] text];
    [ddAnswers addObject:[[sender titleLabel] text]];
   
        if(doubleDipBool2){
            if([[currentQuestionUsefulVariable valueForKey:@"a1"] isEqualToString:[ddAnswers objectAtIndex:0]] ){
                answer = [ddAnswers objectAtIndex:0];
            }
            if([[currentQuestionUsefulVariable valueForKey:@"a1"] isEqualToString:[ddAnswers objectAtIndex:1]] ){
                answer = [ddAnswers objectAtIndex:1];
            }
            doubleDipBool2 = false;

        }
        
        //recieve Answer !
        // looks like url is the same so i will just type url as an argument... put it manually if bugs appear
        NSString *knownObject = answer;
        NSArray *temp = [currentQuestionUsefulVariable allKeysForObject:knownObject];
        NSString *key = [temp lastObject];
        NSString *recieveAnswerCmd = [NSString stringWithFormat:@"?&cmd=receiveAnswer&userFK=%i&questionFK=%i&answer=%@",(int)object.userID,currentQuestionID,key];
        [DataClass callPostURLGlobal:url username:@"" password:@"" command:recieveAnswerCmd];
        
        //end of recieve answer
   //checks if answer key is equal to a1 ( which is always the correct answer )
    if([[currentQuestionUsefulVariable valueForKey:@"a1"] isEqualToString:answer] ){
     [questionLabel setBackgroundColor:[UIColor greenColor]];
        //(int)obj.correctQuestionsCount += 1;
        correctQuestionsCount1 ++;
    }
    //answer is wrong
    else{
        [questionLabel setBackgroundColor:[UIColor redColor]];
        //obj.wrongQuestionsCount += 1;
        wrongQuestionsCount1 ++;
    }

    [timer awakeFromNib];
    [circle awakeFromNib];
    [self drawCircleWithTImer];
    [self timerFunc];
    questionCount1++;
    [self setQuestionsAndAnswersRandom];
    //recieve answer task
    if(questionCount1 == 10){
        object.questionsCount = (unsigned)questionCount1;
        object.correctQuestionsCount = (unsigned)correctQuestionsCount1;
        object.wrongQuestionsCount = (unsigned)wrongQuestionsCount1;
        [timer invalidate];
        [self performSegueWithIdentifier:@"toSummaryScreen" sender:self];
        // this is the last step done before summary screen
        object.credits = localCredits;
        object.points = localPoints;
    }
    } // end of if
}
    


- (IBAction)jokerButtonPressed:(id)sender {
    object.itsTimeForButtonPressedBooleanValue = true;
    NSString* joker = [[sender titleLabel] text];
    if([joker isEqualToString:@"Ask the Audience"]){
       // last
        int price = (int)object.priceAudience;
        NSLog(@"Global var for credits = %i",localCredits);
        localCredits = localCredits - price;
        NSLog(@"Global var for credits = %i",localCredits);
        [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", localCredits]];
    }
    if([joker isEqualToString:@"Switch Question"]){
        int price = (int)object.priceSwitch;
        localCredits = localCredits - price;
        NSLog(@"Global var for credits = %i",localCredits);
        [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", localCredits]];
        
        
        url = @"http://quizter.me/api/questions.php";
        cmd = [NSString stringWithFormat:@"?&cmd=useLifeline&lifeline=switch&questionFK=%i",currentQuestionID];
        NSLog(@"Request vars URL: %@ CMD: %@",url,cmd);
       NSDictionary *newSwitchedQuestionData = [[DataClass callPostURLGlobal:url username:@"" password:@"" command:cmd] valueForKey:@"question"];
        currentQuestionUsefulVariable = newSwitchedQuestionData;
        if(questionCount1 < 10){
        //    self->currentQuestionUsefulVariable = object.currentQuestionsArray[questionCount1];
        }
        NSArray *myarcConfigurations = @[@"a4,a2,a1,a3", @"a1,a2,a3,a4", @"a4,a1,a3,a2",@"a3,a2,a4,a1",
                                         @"a1,a3,a2,a4",@"a4,a2,a1,a3",@"a4,a1,a3,a2",@"a3,a2,a1,a4", @"a2,a1,a4,a3", @"a4,a1,a2,a3"];
        int random = arc4random_uniform(10);
        NSLog(@"%i",random);
        NSString *currentConfig = myarcConfigurations[random];
        NSString * ans1 = [currentConfig substringWithRange:NSMakeRange(0, 2)];
        NSString * ans2 = [currentConfig substringWithRange:NSMakeRange(3, 2)];
        NSString * ans3 = [currentConfig substringWithRange:NSMakeRange(6, 2)];
        NSString * ans4 = [currentConfig substringWithRange:NSMakeRange(9,2)];
        
        
        currentQuestionID = [[newSwitchedQuestionData valueForKey: @"id"]intValue];
        [_ansLabelA setTitle: [newSwitchedQuestionData valueForKey: ans1] forState:UIControlStateNormal];
        [_ansLabelB setTitle: [newSwitchedQuestionData valueForKey:ans2] forState: UIControlStateNormal];
        [_ansLabelC setTitle: [newSwitchedQuestionData valueForKey:ans3] forState: UIControlStateNormal];
        [_ansLabelD setTitle: [newSwitchedQuestionData valueForKey:ans4] forState: UIControlStateNormal];
        //    if( ( questionCount1 % 2 == 0 && questionCount1 < 5) )
        //put them in the for loop
        _questionTextLabel.text = [newSwitchedQuestionData valueForKey:@"q"];
        
        // timer resets
        [timer invalidate];
        [self->circle removeFromSuperlayer];
        _timerDigit.textColor = [UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:1];
        _timerDigit.text = [NSString stringWithFormat:@"SWITCH"];
        
        duration = 11;
        [timer awakeFromNib];
        //[circle removeAllAnimations];
        [circle awakeFromNib];
        [self drawCircleWithTImer];
        
        [self timerFunc];
    }
    if([joker isEqualToString:@"50/50"]){
        int price = (int)object.price5050;
        localCredits = localCredits - price;
        NSLog(@"Global var for credits = %i",localCredits);
        [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", localCredits]];
        NSArray *myarcConfigurations = @[@"a1,a3", @"a1,a2", @"a4,a1",@"a4,a1", @"a2,a1"];
        int random = arc4random_uniform(5);
        NSLog(@"%i",random);
        NSString *currentConfig = myarcConfigurations[random];
        NSString * ans1 = [currentConfig substringWithRange:NSMakeRange(0, 2)];
        NSString * ans2 = [currentConfig substringWithRange:NSMakeRange(3, 2)];
        
        
        currentQuestionID = [[currentQuestionUsefulVariable valueForKey: @"id"]intValue];
        [_ansLabelA setTitle: [currentQuestionUsefulVariable valueForKey: ans1] forState:UIControlStateNormal];
        [_ansLabelB setTitle: [currentQuestionUsefulVariable valueForKey:ans2] forState: UIControlStateNormal];
        
        [_ansLabelC setAlpha:(0.0)];
        [_ansLabelD setAlpha:(0.0)];
        
    }
    else if ([joker isEqualToString:@"Double Dip"]){
        
        int price = (int)object.priceDd;
        NSLog(@"Var for credits = %i",localCredits);
        localCredits = localCredits - price;
        NSLog(@"Var for credits = %i",localCredits);
        
        [_creditsLabel setText:[NSString stringWithFormat:@"%i CREDITS", localCredits]];
        
        
        //here i should get two answers before making the request
        //if one of them is correc
        doubleDipBool = true;
        
        url = @"http://quizter.me/api/questions.php";
        cmd = [NSString stringWithFormat:@"?&cmd=useLifeline&lifeline=dd&questionFK=%i",currentQuestionID];
        NSLog(@"Request vars URL: %@ CMD: %@",url,cmd);
        [DataClass callPostURLGlobal:url username:@"" password:@"" command:cmd];
    }
}


-(void)countDown{
    NSLog(@"Duration now in seconds: %i ",duration);
        duration -= 1;
        _timerDigit.text = [NSString stringWithFormat:@"%i",duration];
        if(duration <=7  && duration >= 4){
            _timerDigit.textColor = [UIColor orangeColor];
            circle.strokeColor = [UIColor orangeColor].CGColor;
        }
        else if(duration < 4 && duration >0){
            _timerDigit.textColor = [UIColor redColor];
            circle.strokeColor = [UIColor redColor].CGColor;
        }
   
        else if(duration > 7){
            _timerDigit.textColor = [UIColor grayColor];
            circle.strokeColor = [UIColor grayColor].CGColor;
        }
      else  if(duration == 0){
          
          _timerDigit.text = [NSString stringWithFormat:@"0"];
            _timerDigit.textColor = [UIColor blackColor];
          ddAnswers = nil;
          [self->circle removeFromSuperlayer];
          // removes old circle
          //circle.strokeColor =[UIColor colorWithRed:18.0f/255.0f green:189.0f/255.0f blue:221.0f/255.0f alpha:0].CGColor;
          [timer invalidate];
          [self answerButtonPressed:nil];
        }
}

- (void)drawCircleWithTImer {
    
    // Set up the shape of the circle
    int radius = 30;
    circle = [CAShapeLayer layer];
    // Make a circular shape
    circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius)
                                             cornerRadius:radius].CGPath;
    // Center the shape in self.view
    // radius 30 is 6.7 * y :)
    circle.position = CGPointMake(CGRectGetMidX(self.view.frame)-radius,
                                  CGRectGetMidY(self.view.frame)-radius*6.7);
    
    // Configure the apperence of the circle
    circle.fillColor = [UIColor colorWithHue:1.0f saturation:1.0f brightness:1.0f alpha:0].CGColor;
    //circle.fillColor = [UIColor clearColor].CGColor;
    //circle.fillColor = (__bridge CGColorRef)([UIColor blueColor]);
    //circle.strokeColor = [UIColor darkGrayColor].CGColor;
    
    circle.lineWidth = 4;
    
    // Add to parent layer
    [self.view.layer addSublayer:circle];
    
    // Configure animation
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 10.0; // "animate over 10 seconds or so.."
    drawAnimation.repeatCount         = 1.0;  // Animate only once..
    
    
    
    
    // Animate from no part of the stroke being drawn to the entire stroke being drawn
    drawAnimation.fromValue = [NSNumber numberWithFloat:1.0f];
    drawAnimation.toValue   = [NSNumber numberWithFloat:0.0f];
    
    // Experiment with timing to get the appearence to look the way you want
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    // Add the animation to the circle
    [circle addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    
    
}

- (void)timerFunc {
    //Adds a timer
    
 //   [timer delete:self];
    //[timer fire];
    duration = 11;
  //  [timer performSelector:@selector(countDown) withObject:self];

  timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}




@end

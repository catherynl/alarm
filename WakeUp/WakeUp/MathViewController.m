//
//  MathViewController.m
//  WakeUp
//
//  Created by Judy Mai on 6/29/15.
//  Copyright (c) 2015 BigNerdRanch. All rights reserved.
//

#import "MathViewController.h"

@interface MathViewController ()
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextField *answerField;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) NSInteger rightCount;
@end

@implementation MathViewController

NSInteger num1, num2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.answerField.keyboardType = UIKeyboardTypeNumberPad;
    num1 = arc4random_uniform(10);
    num2 = arc4random_uniform(10);
    self.questionLabel.text = [NSString stringWithFormat:@"What is %d * %d?", (int)num1, (int)num2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)submitIsPressed:(id)sender {
    [self sendAnswer];
}

- (void)sendAnswer {
    NSInteger ans = num1 * num2;
    NSLog(@"Ans should be %d", (int)ans);
    //NSLog(@"User put %d", [self.answerField.text intValue]);
    if ([self.answerField.text intValue] == (int)ans) {
        NSLog(@"Answered correctly");
        self.resultLabel.text = @"Correct!";
        self.resultLabel.textColor = [UIColor greenColor];
        _rightCount++;
        [self showNewQuestion];
    } else {
        NSLog(@"Fail, lrn2math");
        self.resultLabel.text = @"Wrong!";
        self.resultLabel.textColor = [UIColor redColor];
        [self showNewQuestion];
    }
    if (_rightCount >= 5) {
        self.resultLabel.text = @"Can shut off alarm now";
    }
}

/*
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
       return YES;
}
*/

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (void)showNewQuestion {
    self.answerField.text = @"";
    num1 = arc4random_uniform(10);
    num2 = arc4random_uniform(10);
    self.questionLabel.text = [NSString stringWithFormat:@"What is %d * %d?", (int)num1, (int)num2];
}
    
@end

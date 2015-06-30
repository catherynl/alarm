//
//  AlarmViewController.m
//  WakeUp
//
//  Created by Judy Mai on 6/29/15.
//  Copyright (c) 2015 BigNerdRanch. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *setAlarmButton;
@property (weak, nonatomic) IBOutlet UIButton *chooseVCButton;

@end

@implementation AlarmViewController

- (IBAction)setAlarmButtonPressed:(id)sender {
    NSDate *date = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    NSLog(@"Setting an alarm for %@", [dateFormatter stringFromDate:date]);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alarm set!"
                                                    message:@"Be ready to wake up tomorrow!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    alert.tag = 99;
    [alert show];
    
//    UILocalNotification *note = [[UILocalNotification alloc] init];
//    note.alertBody = @"WAKE UP!";
//    note.fireDate = date;
//    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    
    NSDate *currentDate = [NSDate date];
    NSInteger numberOfSecs = [date timeIntervalSinceDate:currentDate];
    [NSTimer scheduledTimerWithTimeInterval:numberOfSecs
                                     target:self
                                   selector:@selector(timerWentOff)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)timerWentOff {
    NSLog(@"Timer went off");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"WAKE UP!"
                                                    message:@"It's morning! Time to do some thinking."
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    alert.delegate = self;
    alert.tag = 100;
    [alert show];
}

// COME BACK HERE
//- (void)alertViewCancel:(UIAlertView *)alertView {
//    NSLog(@"Alert view cancelled");
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    window.rootViewController = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"chooseVC"];
//}
//
//- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated {
//    NSLog(@"Called dismissWithClickedButtonIndex: %lu", (long)buttonIndex);
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    window.rootViewController = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"chooseVC"];
//}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == 99) {
        NSLog(@"Alert with tag 99 called");
    } else if (alertView.tag == 100) {
        NSLog(@"Alert with tag 100 called");
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        window.rootViewController = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"chooseVC"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.setAlarmButton.layer.cornerRadius = 15;
    self.setAlarmButton.clipsToBounds = YES;
    self.chooseVCButton.layer.cornerRadius = 15;
    self.setAlarmButton.clipsToBounds = YES;
    
//    self.datePicker.datePickerMode = UIDatePickerModeTime;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

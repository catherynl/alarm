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
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    alert.delegate = self;
    [alert show];
}

// COME BACK HERE
- (void)alertViewCancel:(UIAlertView *)alertView {
    NSLog(@"Alert view cancelled");
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"chooseVC"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

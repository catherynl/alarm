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
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Alarm set!";
    note.fireDate = date;
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
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

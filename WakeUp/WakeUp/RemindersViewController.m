//
//  RemindersViewController.m
//  WakeUp
//
//  Created by Catherine Li on 6/29/15.
//  Copyright © 2015 BigNerdRanch. All rights reserved.
//

#import "RemindersViewController.h"

@interface RemindersViewController ()

@end

@implementation RemindersViewController

- (instancetype)init {
    if (self = [super init]) {
        self.navigationItem.title = @"Reminders";
        self.reminderItems = @[@"Reminder"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)addButtonPressed:(id)sender {
    
}

@end

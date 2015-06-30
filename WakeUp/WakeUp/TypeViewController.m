//
//  TypeViewController.m
//  WakeUp
//
//  Created by Judy Mai on 6/30/15.
//  Copyright (c) 2015 BigNerdRanch. All rights reserved.
//

#import "TypeViewController.h"

@interface TypeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@property (weak, nonatomic) IBOutlet UILabel *bLabel;
@property (weak, nonatomic) IBOutlet UILabel *cLabel;
@property (weak, nonatomic) IBOutlet UILabel *dLabel;
@property (weak, nonatomic) IBOutlet UILabel *eLabel;
@property (weak, nonatomic) IBOutlet UITextField *aField;
@property (weak, nonatomic) IBOutlet UITextField *bField;
@property (weak, nonatomic) IBOutlet UITextField *cField;
@property (weak, nonatomic) IBOutlet UITextField *dField;
@property (weak, nonatomic) IBOutlet UITextField *eField;
@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self inputRandomLetters];
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

- (void)inputRandomLetters {
    NSString *letters = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    for (int i = 0; i < 5; i++) {
        NSInteger index = arc4random_uniform(52);
        NSString *str = [letters substringWithRange:NSMakeRange(index, 1)];
        if (i == 0) {
            self.aLabel.text = str;
        } else if (i == 1) {
            self.bLabel.text = str;
        } else if (i == 2) {
            self.cLabel.text = str;
        } else if (i == 3) {
            self.dLabel.text = str;
        } else {
            self.eLabel.text = str;
        }
    }
    /*
    self.aField.text = @"";
    self.bField.text = @"";
    self.cField.text = @"";
    self.dField.text = @"";
    self.eField.text = @"";
     */
}

@end

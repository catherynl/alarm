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
    
    self.aField.text = @"";
    self.bField.text = @"";
    self.cField.text = @"";
    self.dField.text = @"";
    self.eField.text = @"";
    
}
- (IBAction)editChangedA:(id)sender {
    [self setABlue];
    [self correctALetter];
    [self allGreen];
}

- (IBAction)editChangedB:(id)sender {
    [self setBBlue];
    [self correctBLetter];
    [self allGreen];
}

- (IBAction)editChangedC:(id)sender {
    [self setCBlue];
    [self correctCLetter];
    [self allGreen];
}

- (IBAction)editChangedD:(id)sender {
    [self setDBlue];
    [self correctDLetter];
    [self allGreen];
}

- (IBAction)editChangedE:(id)sender {
    [self setEBlue];
    [self correctELetter];
    [self allGreen];
}

- (void)setABlue {
    if (self.aField.text.length == 0) {
        self.aField.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setBBlue {
    if (self.bField.text.length == 0) {
        self.bField.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setCBlue {
    if (self.cField.text.length == 0) {
        self.cField.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setDBlue {
    if (self.dField.text.length == 0) {
        self.dField.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)setEBlue {
    if (self.eField.text.length == 0) {
        self.eField.backgroundColor = [UIColor lightGrayColor];
    }
}

- (void)correctALetter {
    if ([self.aLabel.text isEqualToString:self.aField.text]) {
        self.aField.backgroundColor = [UIColor greenColor];
    } else if (self.aField.text.length > 0) {
        self.aField.backgroundColor = [UIColor redColor];
    } else {
        self.aField.backgroundColor = [UIColor blueColor];
    }
}

- (void)correctBLetter {
    if ([self.bLabel.text isEqualToString:self.bField.text]) {
        self.bField.backgroundColor = [UIColor greenColor];
    } else if (self.bField.text.length > 0) {
        self.bField.backgroundColor = [UIColor redColor];
    }
}

- (void)correctCLetter {
    if ([self.cLabel.text isEqualToString:self.cField.text]) {
        self.cField.backgroundColor = [UIColor greenColor];
    } else if (self.cField.text.length > 0) {
        self.cField.backgroundColor = [UIColor redColor];
    }
}

- (void)correctDLetter {
    if ([self.dLabel.text isEqualToString:self.dField.text]) {
        self.dField.backgroundColor = [UIColor greenColor];
    } else if (self.dField.text.length > 0) {
        self.dField.backgroundColor = [UIColor redColor];
    }
}

- (void)correctELetter {
    if ([self.eLabel.text isEqualToString:self.eField.text]) {
        self.eField.backgroundColor = [UIColor greenColor];
    } else if (self.eField.text.length > 0) {
        self.eField.backgroundColor = [UIColor redColor];
    }
}

- (void)allGreen {
    if (self.aField.backgroundColor == [UIColor greenColor] &&
        self.bField.backgroundColor == [UIColor greenColor] &&
        self.cField.backgroundColor == [UIColor greenColor] &&
        self.dField.backgroundColor == [UIColor greenColor] &&
        self.eField.backgroundColor == [UIColor greenColor]) {
        [self.view endEditing:YES];
        [self performSelector:@selector(moveToReminder) withObject:self afterDelay:0.5 ];
    }
}

- (void)moveToReminder {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    window.rootViewController = [window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"navreminderVC"];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}


@end

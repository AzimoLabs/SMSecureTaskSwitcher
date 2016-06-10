//
//  SMViewController.m
//  SMSecureTaskSwitcher
//
//  Created by Mateusz Kuźnik on 06/10/2016.
//  Copyright (c) 2016 Mateusz Kuźnik. All rights reserved.
//

#import "SMViewController.h"

@interface SMViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfBirthDay;

@end

@implementation SMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addHideKeyboardEventHandler];
}

- (void)addHideKeyboardEventHandler {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [tapGestureRecognizer setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    self.view.userInteractionEnabled = YES;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (IBAction)secure:(id)sender {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    self.view.backgroundColor = color;
}

@end

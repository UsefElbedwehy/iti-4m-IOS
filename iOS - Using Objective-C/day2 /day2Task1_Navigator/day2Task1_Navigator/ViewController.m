//
//  ViewController.m
//  day2Task1_Navigator
//
//  Created by Uef on 18/12/2024.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *label1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)sendToNextView:(id)sender {
    SecondViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    sVC.labelBridge = _label1.text;
    sVC.delegete = self;
    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)clearText { 
    _label1.text = @"";
}

@end

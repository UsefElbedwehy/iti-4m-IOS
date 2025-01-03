//
//  ViewController.m
//  day1Task3_CopyingText
//
//  Created by JETSMobileLabMini5 on 17/12/2024.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelData;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)enterData:(id)sender {
    _labelData.text = _textField.text  ;
}


@end

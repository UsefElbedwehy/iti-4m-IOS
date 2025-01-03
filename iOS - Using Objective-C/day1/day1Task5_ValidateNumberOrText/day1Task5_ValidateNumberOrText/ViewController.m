//
//  ViewController.m
//  day1Task5_ValidateNumberOrText
//
//  Created by JETSMobileLabMini5 on 17/12/2024.
//

#import "ViewController.h"
#define IS_TEXT  0
#define IS_NUMBER 1
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)checkStatus:(id)sender {
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init] ;
    NSNumber* number = [numberFormatter numberFromString:_inputField.text];
    bool isNumber = false;
    if(number != nil){
        isNumber = true;
    }
    if ([_inputField.text isEqual:@""]) {
        _status.text = @"No input, enter data";
    }else{
        switch([sender tag]){
            case IS_TEXT:
                if(!isNumber){
                    _status.text = @"yes, it is text";
                }else{
                    _status.text = @"No, it is not number";
                }
                break;
            case IS_NUMBER:
                if(isNumber){
                    _status.text = @"yes, it is number";
                }else{
                    _status.text = @"No, it is not number";
                }
                break;
        }
    }
}


@end

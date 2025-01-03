//
//  ViewController.m
//  day1Task6_calculator
//
//  Created by JETSMobileLabMini5 on 17/12/2024.
//

#import "ViewController.h"
#define NUM_STATUS 0
#define OP_STATUS  1
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *expressionLB;


@property NSMutableString * expressionStr;
@property int numOpStatus;
//@property const NSNumber * opStatus;
@property int dotLevel;
@property bool divByZero;
@property bool getResultPressed;
@end

@implementation ViewController
- (IBAction)allClear:(id)sender {
    _expressionLB.text = @"";
    [_expressionStr setString:@""];
}



- (IBAction)addNumber:(id)sender {
    if(_getResultPressed){
        _getResultPressed=false;
        [_expressionStr setString:@""];
    }
    switch ([sender tag]) {
        case 0:
            if([_expressionStr characterAtIndex:[_expressionStr length]-1] == '/' ||
               [_expressionStr characterAtIndex:[_expressionStr length]-1] == '*'){
                _divByZero=true;
                [_expressionStr appendString:@"0"];
            }else{
                [_expressionStr appendString:@"0"];
            }
            break;
        case 1:[_expressionStr appendString:@"1"]; break;
        case 2:[_expressionStr appendString:@"2"]; break;
        case 3:[_expressionStr appendString:@"3"]; break;
        case 4:[_expressionStr appendString:@"4"]; break;
        case 5:[_expressionStr appendString:@"5"]; break;
        case 6:[_expressionStr appendString:@"6"]; break;
        case 7:[_expressionStr appendString:@"7"]; break;
        case 8:[_expressionStr appendString:@"8"]; break;
        case 9:[_expressionStr appendString:@"9"]; break;
        case 10:
            if(_dotLevel == 0){
                if([_expressionStr characterAtIndex:[_expressionStr length]-1] != '.' ){
                    if (_numOpStatus == OP_STATUS ) {
                        [_expressionStr appendString:@"0."];
                    }else{
                        [_expressionStr appendString:@"."];
                    }
                    _dotLevel = 1;
            }
            }
            break;
        default: break;
    }
    _numOpStatus=NUM_STATUS;
        _expressionLB.text = _expressionStr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _expressionStr = [[NSMutableString alloc] init];
    _numOpStatus = NUM_STATUS;
    _divByZero = false;
}
- (IBAction)addOperand:(id)sender {
    _getResultPressed=false;
    if([_expressionStr characterAtIndex:[_expressionStr length]-1] == '.' &&
       [_expressionStr characterAtIndex:[_expressionStr length]-2] == '0'
       ){
        [_expressionStr substringToIndex:[_expressionStr length]-2];
    }else if([_expressionStr characterAtIndex:[_expressionStr length]-1] == '.' ){
        [_expressionStr appendString:@"0"];
    }
    if( _numOpStatus != OP_STATUS){
        _dotLevel= 0;
        switch ([sender tag]) {
            case 12:
                [_expressionStr appendString:@"+"];
                break;
                        case 13:
                [_expressionStr appendString:@"-"];
                break;
                        case 14:
                [_expressionStr appendString:@"/"];
                break;
                        case 15:
                [_expressionStr appendString:@"*"];
                break;
        }
    }
    _numOpStatus = OP_STATUS ;
    _expressionLB.text = _expressionStr;
}
- (IBAction)addResult:(id)sender {
    if([_expressionStr length] != 0){
        if(!_divByZero){
            if([_expressionStr characterAtIndex:[_expressionStr length]-1] == '.' &&
               [_expressionStr characterAtIndex:[_expressionStr length]-2] == '0'
               ){
                [_expressionStr substringToIndex:[_expressionStr length]-2];
            }else if([_expressionStr characterAtIndex:[_expressionStr length]-1] == '.' ){
                [_expressionStr appendString:@"0"];
            }
            NSPredicate * parsed = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"1.0 * %@ = 0", _expressionStr]];
            NSExpression * exp = [(NSComparisonPredicate *)parsed leftExpression];
            NSNumber * result = [exp expressionValueWithObject:nil context:nil];
            
            _expressionLB.text = result.stringValue;
            
            [_expressionStr setString:result.stringValue];
        }else{
            _expressionLB.text = @"Division By Zero";
            [_expressionStr setString:@""];
            _divByZero=false;
        }
        //[_expressionStr setString: @""];
        _getResultPressed = true;
    }
}



@end

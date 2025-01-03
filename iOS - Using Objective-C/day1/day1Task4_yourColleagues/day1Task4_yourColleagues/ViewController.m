//
//  ViewController.m
//  day1Task4_yourColleagues
//
//  Created by JETSMobileLabMini5 on 17/12/2024.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colleagueName;
@property NSArray *colleaguesArray;
@property int indecateLevel;
@end

@implementation ViewController
-(void) initColleages {
    NSString *values[11];
    values[0] = @"Usef";
    values[1] = @"Youssab";
    values[2] = @"Kerollos";
    values[3] = @"Andrew";
    values[4] = @"Zeiad";
    values[5] = @"Rokaya";
    values[6] = @"Mai";
    values[7] = @"Radwa";
    values[8] = @"Eman";
    values[9] = @"Nardeen";
    values[10] = @"Salma";
    _colleaguesArray = [[NSArray alloc] initWithObjects:values count:11];
    _indecateLevel=0;
    _colleagueName.text = _colleaguesArray[0];
    _colleagueName.textColor = [UIColor orangeColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initColleages];
}
- (IBAction)setNextColleague:(id)sender {
    if(_indecateLevel < 10){
        _indecateLevel++;
    }else if(_indecateLevel == 10){
        _indecateLevel = 0;
    }
    _colleagueName.text = _colleaguesArray[_indecateLevel];
}
- (IBAction)setPrevColleague:(id)sender {
    if(_indecateLevel > 0){
        _indecateLevel--;
    }else if(_indecateLevel == 0){
        _indecateLevel = 10;
    }
    _colleagueName.text = _colleaguesArray[_indecateLevel];
}


@end

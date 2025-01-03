//
//  SecondViewController.m
//  day2Task1_Navigator
//
//  Created by Uef on 18/12/2024.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@end

@implementation SecondViewController
- (void) goToPrevAndClear{
    [_delegete clearText];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *btnSave = [[UIBarButtonItem alloc]
                                        initWithTitle:@"Clear"
                                style:UIBarButtonItemStylePlain
                                        target:self
                                action:@selector(goToPrevAndClear)];
         self.navigationItem.rightBarButtonItem = btnSave;

    _templateText = @"Hello ";
    // Do any additional setup after loading the view.
    _templateText = [_templateText stringByAppendingString:_labelBridge];
    _labelname.text =  _templateText;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  SecondViewController.m
//  day3Task1_CombinedTabbedAndNavigaionBr
//
//  Created by Uef on 19/12/2024.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)GgoToThird:(id)sender {
    ThirdViewController * tVC = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [self.navigationController pushViewController:tVC animated:YES];
    
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

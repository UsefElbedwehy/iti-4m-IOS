//
//  SecondViewController.m
//  day3Task3_Swipe
//
//  Created by Uef on 19/12/2024.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

-(void) goToRight{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) goToLeft{
    ThirdViewController * tVC = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [self presentViewController:tVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer * nextG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToLeft)];
    UISwipeGestureRecognizer * nextGL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToRight)];
    
    nextG.direction  = UISwipeGestureRecognizerDirectionLeft;
    nextGL.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:nextG];
    [self.view addGestureRecognizer:nextGL];
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

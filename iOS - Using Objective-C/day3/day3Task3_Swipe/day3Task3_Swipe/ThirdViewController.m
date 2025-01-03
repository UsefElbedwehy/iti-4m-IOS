//
//  ThirdViewController.m
//  day3Task3_Swipe
//
//  Created by Uef on 19/12/2024.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
-(void) goToBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}-(void) goToNext{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer * prevG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToBack)];
    prevG.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:prevG];
    UISwipeGestureRecognizer * nextG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToNext)];
    nextG.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:nextG];
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

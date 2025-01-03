//
//  ViewController.m
//  day3Task3_Swipe
//
//  Created by Uef on 19/12/2024.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void) goToRight{
    SecondViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [self presentViewController:sVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer * stageOne = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goToRight)];
    stageOne.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:stageOne];
}


@end

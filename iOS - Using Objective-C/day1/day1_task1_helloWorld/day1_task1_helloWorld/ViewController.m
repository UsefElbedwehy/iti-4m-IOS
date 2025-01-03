//
//  ViewController.m
//  day1_task1_helloWorld
//
//  Created by JETSMobileLabMini5 on 17/12/2024.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayContent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)printHelloWorld:(id)sender {
    _displayContent.text = @"Hello World!";
}


@end

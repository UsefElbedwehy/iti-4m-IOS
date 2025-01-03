//
//  ViewController.m
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 19/12/2024.
//

#import "ViewController.h"
#import "secondViewController.h"
#import "TableViewController.h"
#define EMPTY_TEXT @""
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginUserName;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet UIButton *revealButton;

@end

@implementation ViewController
-(void) clearLabels{
    _loginUserName.text = EMPTY_TEXT;
    _loginPassword.text = EMPTY_TEXT;
}
-(void) enableSecure{
    _loginPassword.secureTextEntry = YES;
}
-(void) DisableSecure{
    _loginPassword.secureTextEntry = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    regUserName = [NSUserDefaults standardUserDefaults];
    regUserPswd = [NSUserDefaults standardUserDefaults];
    //clear labels
    [self clearLabels];
    [self enableSecure];
}
-(void) pushLoginWarningAlertWithStringMsg: (NSString*) strMsg{
    UIAlertController * emptyUserNameAlert = [UIAlertController alertControllerWithTitle:@"Invalid Login" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
    [emptyUserNameAlert addAction:okAction];
    [self presentViewController:emptyUserNameAlert animated:YES completion:nil];
}

- (IBAction)goToRegisterPage:(id)sender {
    [self clearLabels];
    secondViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"regsterPage"];
    [self.navigationController pushViewController:sVC animated:NO];
}
-(void) navigateToRegisterPage{
    [self clearLabels];
    TableViewController *tVC = [self.storyboard instantiateViewControllerWithIdentifier:@"students"];
    tVC->bridgeUSerName = [regUserName objectForKey:@"userName"];
    [self.navigationController pushViewController:tVC animated:YES];
}
- (IBAction)submitLogin:(id)sender {
    NSString * registerName     = _loginUserName.text;
    NSString * registerPassword = _loginPassword.text;
    NSLog(@"%@",registerPassword);
    NSLog(@"%@",[regUserPswd objectForKey:@"userName"]);
    NSLog(@"%@",[regUserPswd objectForKey:@"userPswd"]);
    
    if([regUserName isEqual:EMPTY_TEXT]){
        [self navigateToRegisterPage];
    }else{
        if([registerName isEqual: EMPTY_TEXT]){
            [self pushLoginWarningAlertWithStringMsg:@"Empty username. Enter a username to login"];
        } else if(![[regUserName objectForKey:@"userName"] isEqual: registerName]){
            [self pushLoginWarningAlertWithStringMsg:@"Invalid username. Enter a valid username to login"];
        }else if(![[regUserPswd objectForKey:@"userPswd"] isEqual:registerPassword]){
            [self pushLoginWarningAlertWithStringMsg:@"Incorrect password!. Enter a correct password to login"];
        }else{
            [self navigateToRegisterPage];
        }
    }
}

- (IBAction)showPassword:(id)sender {
    [self DisableSecure];
    if ([self.revealButton.titleLabel.text isEqualToString:@"Show"]) {
        [self DisableSecure];
        [self.revealButton setTitle:@"Hide" forState:UIControlStateNormal];
    }else {
        [self enableSecure];
        [self.revealButton setTitle:@"Show" forState:UIControlStateNormal];
    }
}

@end

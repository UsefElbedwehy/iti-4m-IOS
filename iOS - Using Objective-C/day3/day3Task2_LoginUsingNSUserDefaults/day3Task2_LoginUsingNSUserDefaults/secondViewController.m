//
//  secondViewController.m
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import "secondViewController.h"
#define EMPTY_TEXT @""
@interface secondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registerUserName;
@property (weak, nonatomic) IBOutlet UITextField *registerPassword;
@property (weak, nonatomic) IBOutlet UIButton *revealButton;
@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self enableSecure];
    [self hideBackButton];
}
-(void) enableSecure{
    _registerPassword.secureTextEntry = YES;
}
-(void) DisableSecure{
    _registerPassword.secureTextEntry = NO;
}
-(void) hideBackButton{
    self.navigationItem.hidesBackButton=YES;
}
-(void) pushRegisterWarningAlertWithStringMsg: (NSString*) strMsg{
    UIAlertController * emptyUserNameAlert = [UIAlertController alertControllerWithTitle:@"Invalid register" message:strMsg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:nil];
    [emptyUserNameAlert addAction:okAction];
    [self presentViewController:emptyUserNameAlert animated:YES completion:nil];
}

- (IBAction)goToSignInPage:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

-(void) setUserDefautValueWithKey: (NSString*) strKey{
    [regUserName setObject:_registerUserName.text forKey:strKey];
}
-(void) setUserPswdDefautValueWithKey: (NSString*) strKey{
    [regUserPswd setObject:_registerPassword.text forKey:strKey];
}

- (IBAction)submitRegister:(id)sender {
    //regex to confirm valid username
    NSString * tempRegisterUserName = _registerUserName.text;
    NSString * tempRegisterUserPswd = _registerPassword.text;
    if([tempRegisterUserName  isEqual: EMPTY_TEXT]){
        [self pushRegisterWarningAlertWithStringMsg:@"Username cannot be empty. Enter a valid username."];
    }else if([tempRegisterUserPswd  isEqual: EMPTY_TEXT]){
        [self pushRegisterWarningAlertWithStringMsg:@"Passwor cannot be empty. Enter a valid password."];
    }else{
        [self setUserDefautValueWithKey:@"userName"];
        [self setUserPswdDefautValueWithKey:@"userPswd"];
        [self.navigationController popViewControllerAnimated:NO];
    }
}
- (IBAction)showPassword:(id)sender {
    [self DisableSecure];
    if ([self.revealButton.titleLabel.text isEqualToString:@"Show"]) {
        [self DisableSecure];
        [self.revealButton setTitle:@"Hide" forState:UIControlStateNormal];
    }else{
        [self enableSecure];
        [self.revealButton setTitle:@"Show" forState:UIControlStateNormal];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SubmitRegisterLabel:(id)sender {
}
@end

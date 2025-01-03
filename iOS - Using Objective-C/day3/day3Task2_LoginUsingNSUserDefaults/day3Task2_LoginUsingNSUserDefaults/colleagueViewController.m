//
//  colleagueViewController.m
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import "colleagueViewController.h"
#import "UserData.h"

@interface colleagueViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@end

@implementation colleagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameLabel.text = [NSString stringWithFormat:@" %@", self.colleagueName];
    self.phoneLabel.text = [NSString stringWithFormat:@" %@", self.colleaguePhone];
    self.ageLabel.text = [NSString stringWithFormat:@" %@", self.colleagueAge];
    self.emailLabel.text = [NSString stringWithFormat:@" %@", self.colleagueEmail];
    self.addressLabel.text = [NSString stringWithFormat:@" %@", self.colleagueAddress];
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

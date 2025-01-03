//
//  ViewController.m
//  day2Task2_Colleagues
//
//  Created by Uef on 18/12/2024.
//

#import "ViewController.h"
#include "TableViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameLabel.text = @"Name: ";
    _nameLabel.text =[_nameLabel.text stringByAppendingString:_CInfo.colleagueName];
    _phoneLabel.text = @"Phone: ";
    _phoneLabel.text =[_phoneLabel.text stringByAppendingString:_CInfo.colleaguePhone];
    _ageLabel.text = @"Age: ";
    _ageLabel.text =[_ageLabel.text stringByAppendingString:_CInfo.colleagueAge];
    _emailLabel.text = @"Email: ";
    _emailLabel.text =[_emailLabel.text stringByAppendingString:_CInfo.colleagueEmail];
    _addressLabel.text = @"Address: ";
    _addressLabel.text =[_addressLabel.text stringByAppendingString:_CInfo.colleagueAddress];
}


@end

//
//  TableViewController.m
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import "TableViewController.h"
#include "colleagueViewController.h"

#define NUMBER_OF_TABLES 2
#define MEN              0
#define WOMEN            1
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"students"];
    _uDataInTableV = [[UserData alloc]init];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                                  style:UIBarButtonItemStylePlain
                                                                                 target:self
                                                                                 action:@selector(addColleague)];
}
-(void)addColleague {
    UIAlertController *addColleagueAlert = [UIAlertController alertControllerWithTitle:@"Add Colleague Details"
                                                                               message:@"Enter all necessary details"
                                                                        preferredStyle:UIAlertControllerStyleAlert];
    [addColleagueAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Name";
    }];
    [addColleagueAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Phone";
    }];
    [addColleagueAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Age";
    }];
    [addColleagueAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Email";
    }];
    [addColleagueAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Address";
    }];
    
    UIAlertAction *submitMaleAction = [UIAlertAction actionWithTitle:@"Male" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self->_uDataInTableV addUserData:addColleagueAlert.textFields[0].text
                                         :addColleagueAlert.textFields[1].text
                                         :addColleagueAlert.textFields[2].text
                                         :addColleagueAlert.textFields[3].text
                                         :addColleagueAlert.textFields[4].text
                                         :YES];
        [self.tableView reloadData];
    }];
    
    UIAlertAction *submitFemaleAction = [UIAlertAction actionWithTitle:@"Female" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self->_uDataInTableV addUserData:addColleagueAlert.textFields[0].text
                                         :addColleagueAlert.textFields[1].text
                                         :addColleagueAlert.textFields[2].text
                                         :addColleagueAlert.textFields[3].text
                                         :addColleagueAlert.textFields[4].text
                                         :NO];
        [self.tableView reloadData];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [addColleagueAlert addAction:submitMaleAction];
    [addColleagueAlert addAction:submitFemaleAction];
    [addColleagueAlert addAction:cancelAction];
    
    [self presentViewController:addColleagueAlert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_TABLES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == MEN) {
        NSLog(@"Male Count: %lu", (NSInteger)[_uDataInTableV maleArrCount]);
        return [_uDataInTableV maleArrCount];
    } else {
        NSLog(@"Female Count: %lu", (unsigned long)[_uDataInTableV femaleArrCount]);
        return [_uDataInTableV femaleArrCount];
    }
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
// set title of section here
    NSString * sectionName;
    switch(section){
        case MEN:
            sectionName = @"Male";
            break;
        case WOMEN:
            sectionName = @"Female";
            break;
        default:
            sectionName = @"Other";
            break;
    }
    return sectionName; //set the title of each section as a date
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"students" forIndexPath:indexPath];
    NSString *name;
    
    if (indexPath.section == MEN) {
        name = [[UserData getMaleColleagueArray]objectAtIndex:indexPath.row];
    } else {
        name = [[UserData getFemaleColleagueArray]objectAtIndex:indexPath.row];
    }
    
    //NSLog(@"Displaying Name: %@", name);
    cell.textLabel.text = name;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    colleagueViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"colleagues"];
    
    // Retrieve the selected colleague's data
    if (indexPath.section == MEN) {
        detailVC.colleagueName = [[UserData getMaleColleagueArray] objectAtIndex:indexPath.row];
        detailVC.colleaguePhone = [_uDataInTableV valueForKey:@"phone"];
        detailVC.colleagueAge = [_uDataInTableV valueForKey:@"phone"];
        detailVC.colleagueEmail = [_uDataInTableV valueForKey:@"phone"];
        detailVC.colleagueAddress = [_uDataInTableV valueForKey:@"phone"];
    } else {
        detailVC.colleagueName = [[UserData getFemaleColleagueArray] objectAtIndex:indexPath.row];
        detailVC.colleaguePhone = [_uDataInTableV valueForKey:@"phone"];
        detailVC.colleagueAge = [_uDataInTableV valueForKey:@"age"];
        detailVC.colleagueEmail = [_uDataInTableV valueForKey:@"email"];
        detailVC.colleagueAddress = [_uDataInTableV valueForKey:@"addres"];
    }
    
    // Push the detail view controller
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

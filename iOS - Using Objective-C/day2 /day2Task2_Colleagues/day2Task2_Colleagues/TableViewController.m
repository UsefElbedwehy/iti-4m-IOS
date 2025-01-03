//
//  TableViewController.m
//  day2Task2_Colleagues
//
//  Created by Uef on 18/12/2024.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "ColeagueInfo.h"
#define NUMBER_OF_TABLES 2
#define MEN              0
#define WOMEN            1
@interface TableViewController ()
@property ColeagueInfo * maleColleagueInfo;
@property ColeagueInfo * femaleColleagueInfo;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    menArray = [[NSMutableArray alloc] initWithObjects:@"Abdelrahman Elsaied",@"Usef Elbedwehy",@"Youssab",@"Zeiad",@"Andrew",@"Kero", nil];
    womenArray = [[NSMutableArray alloc] initWithObjects:@"Nardeen",@"Radwa",@"Rokaya",@"Salma",@"Mai",@"Eman", nil];
    _maleColleagueInfo = [[ColeagueInfo alloc] init];
    _femaleColleagueInfo = [[ColeagueInfo alloc] init];
    _maleColleagueInfo.colleagueName = [[NSMutableArray alloc] initWithArray:menArray];
    _femaleColleagueInfo.colleagueName = [[NSMutableArray alloc] initWithArray:womenArray];
    _maleColleagueInfo.colleagueAddress = [[NSMutableArray alloc] initWithObjects:@"6th of october",@"New Damietta",@"New Daqahlia",@"Helioplis",@"Badr City",@"Sherouq City", nil];
    _femaleColleagueInfo.colleagueAddress = [[NSMutableArray alloc] initWithObjects:@"6th of october",@"Giza",@"New Admin Capital",@"New Valley",@"Madinty",@"Dahab", nil];
    _maleColleagueInfo.colleaguePhone = [[NSMutableArray alloc] initWithObjects:@"+201117721743",@"+201044400055",@"+201111100022",@"+201990100022",@"+201000163022",@"+201770163022", nil];
    _femaleColleagueInfo.colleaguePhone = [[NSMutableArray alloc] initWithObjects:@"+201119921743",@"+201069300055",@"+201000100022",@"+201000100022",@"+201000100022",@"+201000100622", nil];
    _maleColleagueInfo.colleagueAge = [[NSMutableArray alloc] initWithObjects:@"26",@"24",@"23",@"22",@"21",@"25", nil];
    _femaleColleagueInfo.colleagueAge = [[NSMutableArray alloc] initWithObjects:@"22",@"23",@"20",@"22",@"21",@"23", nil];
    _maleColleagueInfo.colleagueEmail = [[NSMutableArray alloc] initWithObjects:@"m1@gmail.com",@"m2@gmail.com",@"m3@gmail.com",@"m4@gmail.com",@"m5@gmail.com",@"m6@gmail.com", nil];
    _femaleColleagueInfo.colleagueEmail = [[NSMutableArray alloc] initWithObjects:@"q1@gmail.com",@"q2@gmail.com",@"q3@gmail.com",@"q4@gmail.com",@"q5@gmail.com",@"q6@gmail.com", nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_TABLES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    char type_flag=0;
    switch (section) {
        case MEN:
            type_flag = [menArray count];
            break;
        default:
            type_flag = [womenArray count];
            break;
    }
    return type_flag;
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
    NSString * cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.section) {
        case MEN:
            cell.textLabel.text =  [menArray objectAtIndex:indexPath.row];
            break;
            
        default:
            cell.textLabel.text =  [womenArray objectAtIndex:indexPath.row];
            break;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController * vC = [self.storyboard instantiateViewControllerWithIdentifier:@"dataDetails"];
    ColeagueInfo * cInfo = [[ColeagueInfo alloc] init];
    switch (indexPath.section) {
        case MEN:
            [cInfo setColleagueName:_maleColleagueInfo.colleagueName[indexPath.row]] ;
            [cInfo setColleaguePhone:_maleColleagueInfo.colleaguePhone[indexPath.row]] ;
            [cInfo setColleagueAge:_maleColleagueInfo.colleagueAge[indexPath.row]] ;
            [cInfo setColleagueEmail:_maleColleagueInfo.colleagueEmail[indexPath.row]] ;
            [cInfo setColleagueAddress:_maleColleagueInfo.colleagueAddress[indexPath.row]] ;
            break;
        case WOMEN:
            [cInfo setColleagueName:_femaleColleagueInfo.colleagueName[indexPath.row]] ;
            [cInfo setColleaguePhone:_femaleColleagueInfo.colleaguePhone[indexPath.row]] ;
            [cInfo setColleagueAge:_femaleColleagueInfo.colleagueAge[indexPath.row]] ;
            [cInfo setColleagueEmail:_femaleColleagueInfo.colleagueEmail[indexPath.row]] ;
            [cInfo setColleagueAddress:_femaleColleagueInfo.colleagueAddress[indexPath.row]] ;
            break;
            
        default:
            printf("Nothing\n");
            break;
    }
    [vC setCInfo:cInfo];
    
    [self.navigationController pushViewController:vC animated:YES];
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

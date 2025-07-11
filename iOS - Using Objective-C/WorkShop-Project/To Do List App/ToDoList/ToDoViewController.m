//
//  ToDoViewController.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "ToDoViewController.h"
#import "ToDoList.h"
#import "AddViewController.h"
#import "DisplayViewController.h"
#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
#import "UserNotifications/UserNotifications.h"
//------priority macros-------------
#define HIGH_PRIO 0
#define MID_PRIO  1
#define LOW_PRIO  2
//----------------------------------
@interface ToDoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property NSMutableArray<ToDoList *> * allTasks;
@property NSMutableArray<ToDoList *> * allTasksInProgress;
@property NSMutableArray<ToDoList *> * highPrioArray;
@property NSMutableArray<ToDoList *> * midPrioArray;
@property NSMutableArray<ToDoList *> * lowPrioArray;

@property NSMutableArray<NSString *> * priorityArr;
@property NSArray       <NSString *> * prioImgArray;
@property NSMutableArray<ToDoList *> * filteredTasks;

@property BOOL isFiltered;

@property (strong, nonatomic) UISearchBar * searchBar;
@property (nonatomic, strong, readwrite) UISearchController * searchController;

@end

@implementation ToDoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArrays];
    [self retrieveAndProcessData];
    [self addRightAddBtn];
    [self addSearchBarToMyTable];
    [self setAllEndTaskDateNotifications];
}
- (void) addSearchBarToMyTable{
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    self.searchBar.showsCancelButton = YES;
    [self.view addSubview:self.searchBar];
    self.searchBar.delegate = self;
    //self.myTableView.contentInset = UIEdgeInsetsMake(self.searchBar.frame.size.height-50,0, 0, 0);
    [self.myTableView setTableHeaderView:self.searchBar];
    _myTableView.contentOffset = CGPointMake( 0,  (_myTableView.tableHeaderView.frame.size.height));
    [self.searchDisplayController setActive:NO animated:YES];
    
}
- (BOOL)hidesSearchBarWhenScrolling{
    return TRUE;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addRightAddBtn];
    [self retrieveAndProcessData];
    [self rehideTheSearchBar];
    [self setAllEndTaskDateNotifications];
    [self.myTableView reloadData];
}
-(void) rehideTheSearchBar{
    _myTableView.contentOffset = CGPointMake( 0,  (_myTableView.tableHeaderView.frame.size.height));
}
-(void) retrieveAndProcessData{
    [NSUserDefaults retrieveUserDefualts:_allTasks ForKey:@"toDoList"];
    [NSUserDefaults retrieveUserDefualts:_allTasksInProgress ForKey:@"toDoListInProgress"];
    [NSUserDefaults convertArray:_allTasks ToThreePrioArrWithHighArr:_highPrioArray andMidArr:_midPrioArray andLowArr:_lowPrioArray];
}
-(void) initArrays{
    _allTasks = [NSMutableArray<ToDoList *> new];
    _allTasksInProgress = [NSMutableArray<ToDoList *> new];
    _highPrioArray = [NSMutableArray<ToDoList *> new];
    _lowPrioArray  = [NSMutableArray<ToDoList *> new];
    _midPrioArray  = [NSMutableArray<ToDoList *> new];
    _filteredTasks = [NSMutableArray<ToDoList *> new];
    _priorityArr = [[NSMutableArray alloc] initWithObjects:@"High Priority Tasks",@"Midium  Priority Tasks",@"Low  Priority Tasks", nil];
    _prioImgArray = [[NSArray alloc] initWithObjects:@"high.png",@"mid.png",@"low.png", nil];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        _isFiltered = FALSE;
        [_filteredTasks removeAllObjects];
    }else{
        [_filteredTasks removeAllObjects];
        _isFiltered = TRUE;
        for (int i=0; i<[_allTasks count]; i++) {
            if ([[_allTasks objectAtIndex:i].name containsString:searchText] == TRUE) {
               [_filteredTasks addObject:[_allTasks objectAtIndex:i]];
            }
        }
    }
    [self.myTableView reloadData];
}
-(void) addRightAddBtn{
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(addTask)];
}
-(void) addTask{
    AddViewController * AVC = [self.storyboard instantiateViewControllerWithIdentifier:@"addVC"];
    [AVC setDelegete:self];
    [self presentViewController:AVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(_isFiltered){
        return 1;
    }
    return [_priorityArr count];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_isFiltered){
        return [_filteredTasks count];
    }
    switch (section) {
        case HIGH_PRIO:
            return [_highPrioArray count];
            break;
        case MID_PRIO:
            return [_midPrioArray count];
            break;
        case LOW_PRIO:
            return [_lowPrioArray count];
            break;
    }
    return 0;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 65;
//}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"todoCell"];
    UIImageView * imgg1;
    UILabel     * lbl1;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"todoCell"];
    }
    if(_isFiltered){
        lbl1 = (UILabel*)[cell viewWithTag:2];
        lbl1.text = [_filteredTasks objectAtIndex:indexPath.row].name;
        if([_filteredTasks objectAtIndex:indexPath.row].priority == HIGH_PRIO){
            imgg1 = (UIImageView *)[cell viewWithTag:1];
            imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:0]];
        }else if([_filteredTasks objectAtIndex:indexPath.row].priority == MID_PRIO){
            imgg1 = (UIImageView *)[cell viewWithTag:1];
            imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:1]];
        }else{
            imgg1 = (UIImageView *)[cell viewWithTag:1];
            imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:2]];
        }
    }else{
        switch (indexPath.section) {
            case HIGH_PRIO:
                imgg1 = (UIImageView *)[cell viewWithTag:1];
                imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_highPrioArray objectAtIndex:indexPath.row].name;
                break;
            case MID_PRIO:
                imgg1 = (UIImageView *)[cell viewWithTag:1];
                imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_midPrioArray objectAtIndex:indexPath.row].name;
                break;
            case LOW_PRIO:
                imgg1 = (UIImageView *)[cell viewWithTag:1];
                imgg1.image = [UIImage imageNamed:[_prioImgArray objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_lowPrioArray objectAtIndex:indexPath.row].name;
                break;
        }
    }
    lbl1.textColor = [UIColor blackColor];
    lbl1.font = [UIFont fontWithName:@"American Typewriter" size:20];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
   /* Create custom view to display section header... */
   UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
   [label setFont:[UIFont boldSystemFontOfSize:17]];
    NSString *string =[_priorityArr objectAtIndex:section];
   /* Section header is in 0th index... */
   [label setText:string];
   [view addSubview:label];
    if(_isFiltered){
        [view setBackgroundColor:[UIColor colorWithRed:130/255.0 green:130/255.0 blue:240/255.0 alpha:1.0]];
        [label setText:@"Matching tasks"];
    }else{
        switch (section) {
            case HIGH_PRIO:
                [view setBackgroundColor:[UIColor colorWithRed:255/255.0 green:130/255.0 blue:130/255.0 alpha:1.0]];
                break;
            case MID_PRIO:
                [view setBackgroundColor:[UIColor colorWithRed:245/255.0 green:245/255.0 blue:150/255.0 alpha:1.0]];
                break;
            case LOW_PRIO:
                [view setBackgroundColor:[UIColor colorWithRed:150/255.0 green:255/255.0 blue:150/255.0 alpha:1.0]];
                break;
        }
    }
    
   return view;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayViewController * dVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayVC"];
    ToDoList * todoObj = [[ToDoList alloc] init];
    [dVC setNextStageID:@"InProg"];
    [dVC setInProgDelegete:self];
    if (_isFiltered) {
        [todoObj setWithObject:[_filteredTasks objectAtIndex:indexPath.row]];
    }else{
        switch (indexPath.section) {
            case HIGH_PRIO:
                [todoObj setWithObject:[_highPrioArray objectAtIndex:indexPath.row]];
                break;
            case MID_PRIO:
                [todoObj setWithObject:[_midPrioArray objectAtIndex:indexPath.row]];
                break;
            case LOW_PRIO:
                [todoObj setWithObject:[_lowPrioArray objectAtIndex:indexPath.row]];
                break;
        }
    }
    [dVC setToDoObj:todoObj];
    [self.navigationController pushViewController:dVC animated:YES];
    
}
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSString * nameStr =@"";
        switch (indexPath.section) {
            case HIGH_PRIO:
                nameStr = [_highPrioArray objectAtIndex:indexPath.row].name;
                [_highPrioArray removeObjectAtIndex:indexPath.row];
                break;
            case MID_PRIO:
                nameStr = [_midPrioArray objectAtIndex:indexPath.row].name;
                [_midPrioArray removeObjectAtIndex:indexPath.row];
                break;
            case LOW_PRIO:
                nameStr = [_lowPrioArray objectAtIndex:indexPath.row].name;
                [_lowPrioArray removeObjectAtIndex:indexPath.row];
                break;
        }
        [NSUserDefaults removeObjectFromArray:_allTasks ByString:nameStr];
        [NSUserDefaults updateUserDefaults:_allTasks ForKey:@"toDoList"];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
-(void) addTaskToTable:(ToDoList*) list{
    [_allTasks addObject:list];
    [NSUserDefaults convertArray:_allTasks ToThreePrioArrWithHighArr:_highPrioArray andMidArr:_midPrioArray andLowArr:_lowPrioArray];
    [NSUserDefaults updateUserDefaults:_allTasks ForKey:@"toDoList"];
    [_myTableView reloadData];
}

// called by delegete
-(void) addToInProgress : (NSString *) strName{
    for(int i=0;i<[_allTasks count];i++){
        if([strName isEqual: ([_allTasks objectAtIndex:i].name)]){
            [_allTasksInProgress addObject:[_allTasks objectAtIndex:i]];
            [_allTasks removeObjectAtIndex:i];
        }
    }
    [NSUserDefaults updateUserDefaults: _allTasks            ForKey:@"toDoList"];
    [NSUserDefaults updateUserDefaults: _allTasksInProgress  ForKey:@"toDoListInProgress"];
    [NSUserDefaults convertArray:_allTasks ToThreePrioArrWithHighArr:_highPrioArray andMidArr:_midPrioArray andLowArr:_lowPrioArray];
    [self.myTableView reloadData];
}

- (void)scheduleNotificationForDate:(NSDate *)date withTitle:(NSString *)title body:(NSString *)body {
    // Create the notification content
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = title;
    content.body = body;
    content.sound = [UNNotificationSound defaultSound];
    
    // Create the trigger based on date components
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                                   fromDate:date];
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:dateComponents repeats:NO];
    
    // Create and add the notification request
    NSString *identifier = @"LocalNotificationIdentifier";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error scheduling notification: %@", error.localizedDescription);
        } else {
            NSLog(@"Notification scheduled successfully!");
        }
    }];
}

-(void) setAllEndTaskDateNotifications{
    for(int index=0 ; index < [_allTasks count] ; index++){
        NSMutableString * notificationTitle = [[NSMutableString alloc] initWithString:[_allTasks objectAtIndex:index].name];
        [notificationTitle stringByAppendingString:@" Reminder"];
        [self scheduleNotificationForDate:[_allTasks objectAtIndex:index].endDate withTitle:notificationTitle body:@"This is the task's deadline!"];
        NSLog(@"%@",[_allTasks objectAtIndex:index].endDate);
    }
}

@end

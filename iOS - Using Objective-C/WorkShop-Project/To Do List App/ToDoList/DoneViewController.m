//
//  DoneViewController.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "DoneViewController.h"
#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
#import "DisplayViewController.h"
//------priority macros-------------
#define HIGH_PRIO 0
#define MID_PRIO  1
#define LOW_PRIO  2
//----------------------------------
@interface DoneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray<ToDoList *> * allTasksInProg;
@property NSMutableArray<ToDoList *> * allTasksIsDone;

@property NSMutableArray<ToDoList *> * highPrioArrayDone;
@property NSMutableArray<ToDoList *> * midPrioArrayDone;
@property NSMutableArray<ToDoList *> * lowPrioArrayDone;

@property NSMutableArray<NSString *> * priorityArrDone;
@property NSArray       <NSString *> * prioImgArrayDone;

@property BOOL                         IsSorted;
@end

@implementation DoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArrays];
    [NSUserDefaults retrieveUserDefualts:_allTasksInProg ForKey:@"toDoListInProgress"];
    [NSUserDefaults retrieveUserDefualts:_allTasksIsDone ForKey:@"toDoListIsDone"];
    [NSUserDefaults convertArray:_allTasksIsDone ToThreePrioArrWithHighArr:_highPrioArrayDone andMidArr:_midPrioArrayDone andLowArr:_lowPrioArrayDone];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addRightAddBtn];
    [NSUserDefaults retrieveUserDefualts:_allTasksIsDone ForKey:@"toDoListIsDone"];
    [NSUserDefaults convertArray:_allTasksIsDone ToThreePrioArrWithHighArr:_highPrioArrayDone andMidArr:_midPrioArrayDone andLowArr:_lowPrioArrayDone];
    // Reload the table view data
    [self.tableView reloadData];
}
-(void) addRightAddBtn{
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}
-(void) initArrays{
    _allTasksInProg      = [NSMutableArray<ToDoList *> new];
    _allTasksIsDone      = [NSMutableArray<ToDoList *> new];
    _highPrioArrayDone = [NSMutableArray<ToDoList *> new];
    _lowPrioArrayDone  = [NSMutableArray<ToDoList *> new];
    _midPrioArrayDone  = [NSMutableArray<ToDoList *> new];
    _priorityArrDone   = [[NSMutableArray alloc] initWithObjects:@"High Priority Tasks",@"Midium  Priority Tasks",@"Low  Priority Tasks", nil];
    _prioImgArrayDone  = [[NSArray alloc] initWithObjects:@"high.png",@"mid.png",@"low.png", nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_priorityArrDone count];;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case HIGH_PRIO:
            return [_highPrioArrayDone count];
            break;
        case MID_PRIO:
            return [_midPrioArrayDone count];
            break;
        case LOW_PRIO:
            return [_lowPrioArrayDone count];
            break;
    }
    return 0;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DoneVC"];
    UIImageView * imgg2;
    UILabel     * lbl1;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DoneVC"];
    }
    switch (indexPath.section) {
        case HIGH_PRIO:
            imgg2 = (UIImageView *)[cell viewWithTag:3];
            imgg2.image = [UIImage imageNamed:[_prioImgArrayDone objectAtIndex:indexPath.section]];
            lbl1 = (UILabel*)[cell viewWithTag:1];
            lbl1.text = [_highPrioArrayDone objectAtIndex:indexPath.row].name;
            break;
        case MID_PRIO:
            imgg2 = (UIImageView *)[cell viewWithTag:3];
            imgg2.image = [UIImage imageNamed:[_prioImgArrayDone objectAtIndex:indexPath.section]];
            lbl1 = (UILabel*)[cell viewWithTag:1];
            lbl1.text = [_midPrioArrayDone objectAtIndex:indexPath.row].name;
            break;
        case LOW_PRIO:
            imgg2 = (UIImageView *)[cell viewWithTag:3];
            imgg2.image = [UIImage imageNamed:[_prioImgArrayDone objectAtIndex:indexPath.section]];
            lbl1 = (UILabel*)[cell viewWithTag:1];
            lbl1.text = [_lowPrioArrayDone objectAtIndex:indexPath.row].name;
            break;
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
    NSString *string =[_priorityArrDone objectAtIndex:section];
   /* Section header is in 0th index... */
   [label setText:string];
   [view addSubview:label];
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
   return view;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayViewController * dVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayVC"];
    ToDoList * todoObj = [[ToDoList alloc] init];
    switch (indexPath.section) {
        case HIGH_PRIO:
            [todoObj setWithObject:[_highPrioArrayDone objectAtIndex:indexPath.row]];
            break;
        case MID_PRIO:
            [todoObj setWithObject:[_midPrioArrayDone objectAtIndex:indexPath.row]];
            break;
        case LOW_PRIO:
            [todoObj setWithObject:[_lowPrioArrayDone objectAtIndex:indexPath.row]];
            break;
    }
    [dVC setNextStageID:@""];
    [dVC setToDoObj:todoObj];
    [self.navigationController pushViewController:dVC animated:YES];
}

@end

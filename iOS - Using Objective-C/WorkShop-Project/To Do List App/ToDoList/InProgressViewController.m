//
//  InProgressViewController.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//
//------priority macros-------------
#define HIGH_PRIO 0
#define MID_PRIO  1
#define LOW_PRIO  2
//----------------------------------
#import "InProgressViewController.h"
#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
#import "DisplayViewController.h"
@interface InProgressViewController ()
@property NSMutableArray<ToDoList *> * allTasksInProg;
@property NSMutableArray<ToDoList *> * allTasksIsDone;
@property NSMutableArray<ToDoList *> * highPrioArrayInProg;
@property NSMutableArray<ToDoList *> * midPrioArrayInProg;
@property NSMutableArray<ToDoList *> * lowPrioArrayInProg;
@property NSMutableArray<NSString *> * priorityArrInProg;
@property NSArray       <NSString *> * prioImgArrayInProg;
@property BOOL                         IsSorted;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation InProgressViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    [self initAllArrays];
    [NSUserDefaults retrieveUserDefualts:_allTasksInProg ForKey:@"toDoListInProgress"];
    [NSUserDefaults retrieveUserDefualts:_allTasksIsDone ForKey:@"toDoListIsDone"];
    [NSUserDefaults convertArray:_allTasksInProg ToThreePrioArrWithHighArr:_highPrioArrayInProg andMidArr:_midPrioArrayInProg andLowArr:_lowPrioArrayInProg];
    _IsSorted = FALSE;
    
}
- (void) initAllArrays{
    _allTasksInProg = [NSMutableArray<ToDoList *> new];
    _allTasksIsDone = [NSMutableArray<ToDoList *> new];
    _highPrioArrayInProg = [NSMutableArray<ToDoList *> new];
    _lowPrioArrayInProg  = [NSMutableArray<ToDoList *> new];
    _midPrioArrayInProg  = [NSMutableArray<ToDoList *> new];
    [self addRightAddBtn];
    _priorityArrInProg = [[NSMutableArray alloc] initWithObjects:@"High Priority Tasks",@"Midium  Priority Tasks",@"Low  Priority Tasks", nil];
    _prioImgArrayInProg = [[NSArray alloc] initWithObjects:@"high.png",@"mid.png",@"low.png", nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addRightAddBtn];
    [NSUserDefaults retrieveUserDefualts:_allTasksInProg ForKey:@"toDoListInProgress"];
    [NSUserDefaults retrieveUserDefualts:_allTasksIsDone ForKey:@"toDoListIsDone"];
    [NSUserDefaults convertArray:_allTasksInProg ToThreePrioArrWithHighArr:_highPrioArrayInProg andMidArr:_midPrioArrayInProg andLowArr:_lowPrioArrayInProg];
    // Reload the table view data
    [self.tableView reloadData];
}

-(void) addRightAddBtn{
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:self action:@selector(sortAccordiingToPriority)];
}
-(void) sortAccordiingToPriority{
    [NSUserDefaults retrieveUserDefualts:_allTasksInProg ForKey:@"toDoListInProgress"];
    [NSUserDefaults convertArray:_allTasksInProg ToThreePrioArrWithHighArr:_highPrioArrayInProg andMidArr:_midPrioArrayInProg andLowArr:_lowPrioArrayInProg];
    if(_IsSorted){
        _IsSorted = FALSE;
    }else{
        _IsSorted = TRUE;
    }
    [self.tableView reloadData];
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
    if(_IsSorted){
        return [_priorityArrInProg count];
    }else{
        return 1;
    }
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_IsSorted){
        switch (section) {
            case HIGH_PRIO:
                return [_highPrioArrayInProg count];
                break;
            case MID_PRIO:
                return [_midPrioArrayInProg count];
                break;
            case LOW_PRIO:
                return [_lowPrioArrayInProg count];
                break;
        }
    }else{
        return [_allTasksInProg count];
    }
    return 0;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"inprogressCell"];
    UIImageView * imgg2;
    UILabel     * lbl1;
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"inprogressCell"];
    }
    if(_IsSorted){
        switch (indexPath.section) {
            case HIGH_PRIO:
                imgg2 = (UIImageView *)[cell viewWithTag:3];
                imgg2.image = [UIImage imageNamed:[_prioImgArrayInProg objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_highPrioArrayInProg objectAtIndex:indexPath.row].name;
                break;
            case MID_PRIO:
                imgg2 = (UIImageView *)[cell viewWithTag:3];
                imgg2.image = [UIImage imageNamed:[_prioImgArrayInProg objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_midPrioArrayInProg objectAtIndex:indexPath.row].name;
                break;
            case LOW_PRIO:
                imgg2 = (UIImageView *)[cell viewWithTag:3];
                imgg2.image = [UIImage imageNamed:[_prioImgArrayInProg objectAtIndex:indexPath.section]];
                lbl1 = (UILabel*)[cell viewWithTag:2];
                lbl1.text = [_lowPrioArrayInProg objectAtIndex:indexPath.row].name;
                break;
        }
    }else{
        imgg2 = (UIImageView *)[cell viewWithTag:3];
        NSInteger prioNum = 0;
        if([_allTasksInProg objectAtIndex:indexPath.row].priority       == HIGH_PRIO){
            prioNum=HIGH_PRIO;
        }else if([_allTasksInProg objectAtIndex:indexPath.row].priority == MID_PRIO){
            prioNum=MID_PRIO;
        }else{
            prioNum=LOW_PRIO;
        }
        imgg2.image = [UIImage imageNamed:[_prioImgArrayInProg objectAtIndex:prioNum]];
        lbl1 = (UILabel*)[cell viewWithTag:2];
        lbl1.text = [_allTasksInProg objectAtIndex:indexPath.row].name;
    }
    //lbl1.textAlignment = NSTextAlignmentLeft;
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
    NSString *string =[_priorityArrInProg objectAtIndex:section];
   /* Section header is in 0th index... */
    if(_IsSorted){
        [label setText:string];
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
    }else{
        [label setText:@"UnSorted Task"];
        [view setBackgroundColor:[UIColor colorWithRed:200/255.0f green:200/255.0f blue:200/255.0f alpha:1.0f]];
    }
   [view addSubview:label];
   
   return view;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayViewController * dVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DisplayVC"];
    ToDoList * todoObj = [[ToDoList alloc] init];
    if(_IsSorted){
        switch (indexPath.section) {
            case HIGH_PRIO:
                [todoObj setWithObject:[_highPrioArrayInProg objectAtIndex:indexPath.row]];
                break;
            case MID_PRIO:
                [todoObj setWithObject:[_midPrioArrayInProg objectAtIndex:indexPath.row]];
                break;
            case LOW_PRIO:
                [todoObj setWithObject:[_lowPrioArrayInProg objectAtIndex:indexPath.row]];
                break;
        }
    }else{
        [todoObj setWithObject:[_allTasksInProg objectAtIndex:indexPath.row]];
    }
    [dVC setIsDoneDelegete:self];
    [dVC setNextStageID:@"IsDone"];
    [dVC setToDoObj:todoObj];
    [self.navigationController pushViewController:dVC animated:YES];
}
- (void)addToIsDone:(nonnull NSString *)strName { 
    for(int i=0;i<[_allTasksInProg count];i++){
        if([strName isEqual: ([_allTasksInProg objectAtIndex:i].name)]){
            [_allTasksIsDone addObject:[_allTasksInProg objectAtIndex:i]];
            [_allTasksInProg removeObjectAtIndex:i];
        }
    }
    [NSUserDefaults updateUserDefaults: _allTasksInProg            ForKey:@"toDoListInProgress"];
    [NSUserDefaults updateUserDefaults: _allTasksIsDone            ForKey:@"toDoListIsDone"];
    [NSUserDefaults convertArray:_allTasksInProg ToThreePrioArrWithHighArr:_highPrioArrayInProg andMidArr:_midPrioArrayInProg andLowArr:_lowPrioArrayInProg];
    [self.tableView reloadData];
}

@end

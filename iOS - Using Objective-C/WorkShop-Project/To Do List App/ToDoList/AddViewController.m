//
//  AddViewController.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "AddViewController.h"
#import "ToDoList.h"
#import "MyDelegete.h"
#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
#define HIGH_PRIO  0
#define MID_PRIO   1
#define LOW_PRIO   2

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *taskNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateField;
@property (weak, nonatomic) IBOutlet UIDatePicker *endDataeField;
@property ToDoList * toDoListObj;
@property NSMutableArray<ToDoList *> * allTasksArr;
@property NSMutableArray<ToDoList *> * highPrioArr;
@property NSMutableArray<ToDoList *> * midPrioArr;
@property NSMutableArray<ToDoList *> * lowPrioArr;
@property NSMutableArray<NSString *> * priorityArray;
@property NSArray       <NSString *> * prioImgArr;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _toDoListObj = [[ToDoList alloc] init];
    _allTasksArr = [NSMutableArray<ToDoList *> new];
    _highPrioArr = [NSMutableArray<ToDoList *> new];
    _lowPrioArr  = [NSMutableArray<ToDoList *> new];
    _midPrioArr  = [NSMutableArray<ToDoList *> new];
//    _priorityArray = [[NSMutableArray alloc] initWithObjects:@"high",@"mid",@"low", nil];
//    _prioImgArr = [[NSArray alloc] initWithObjects:@"high.png",@"mid.png",@"low.png", nil];
}
- (IBAction)decidePriorityLevel:(id)sender {
    switch ([sender selectedSegmentIndex]) {
        case HIGH_PRIO:
            [_toDoListObj setPriority:HIGH_PRIO];
            break;
        case MID_PRIO:
            [_toDoListObj setPriority:MID_PRIO];
            break;
        case LOW_PRIO:
            [_toDoListObj setPriority:LOW_PRIO];
            break;
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
- (IBAction)addTaskActionBtn:(id)sender {
    [_toDoListObj setName:_taskNameTextField.text];
    [_toDoListObj setDescript:_descriptionTextField.text];
    [_toDoListObj setDate:_dateField.date];
    [_toDoListObj setEndDate:_endDataeField.date];
    [_delegete addTaskToTable:_toDoListObj];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

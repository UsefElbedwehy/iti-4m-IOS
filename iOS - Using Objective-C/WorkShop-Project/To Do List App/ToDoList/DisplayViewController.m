//
//  DisplayViewController.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "DisplayViewController.h"
#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
@interface DisplayViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayNameLB;
@property (weak, nonatomic) IBOutlet UISegmentedControl *displayPrioritySegment;
@property (weak, nonatomic) IBOutlet UIDatePicker *displayedDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *displayedEndDate;
@property (weak, nonatomic) IBOutlet UITextView *displayedDescriptionTextView;
@property (weak, nonatomic) IBOutlet UILabel *statusForNextLB;
@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameEditTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptEditTextFeild;
@property (weak, nonatomic) IBOutlet UILabel *pageTitleLB;

@end

@implementation DisplayViewController
- (IBAction)addToNextStage:(id)sender {
    if([_nextStageID isEqual:@"InProg"]){
        [_inProgDelegete addToInProgress:_toDoObj.name];
    }else if([_nextStageID isEqual:@"IsDone"]){
        _statusForNextLB.text = @"Move to Done Tasks";
        [_IsDoneDelegete addToIsDone:_toDoObj.name];
    }else{
        _statusForNextLB.text = @"";
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_switchBtn setOn:NO];
    _displayNameLB.text = _toDoObj.name;
    _displayedDate.date = _toDoObj.date;
    _displayedEndDate.date = _toDoObj.endDate;
    _displayPrioritySegment.selectedSegmentIndex = _toDoObj.priority;
    _displayedDescriptionTextView.text = _toDoObj.descript;
    if([_nextStageID isEqual:@"InProg"]){
        _statusForNextLB.text = @"move to In Progress Tasks";
        [self addRightAddBtn];
    }else if([_nextStageID isEqual:@"IsDone"]){
        _statusForNextLB.text = @"Move to Done Tasks";
        [self addRightAddBtn];
    }else{
        _statusForNextLB.text = @"";
        _statusForNextLB.hidden=TRUE;
        _switchBtn.hidden = TRUE;
    }
    _displayNameLB.hidden                = FALSE;
    _displayedDescriptionTextView.hidden = FALSE;
    _nameEditTextField.hidden            = TRUE;
    _descriptEditTextFeild.hidden        = TRUE;
    _displayedDate.enabled               = FALSE;
    _displayedEndDate.enabled            = FALSE;
    _displayPrioritySegment.enabled      = FALSE;
    
}
-(void) addRightAddBtn{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editTask)];
}
-(void) editTask{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(saveEditTask)];
    
    _displayedDate.enabled               = TRUE;
    _displayedEndDate.enabled            = TRUE;
    _displayPrioritySegment.enabled      = TRUE;
    _displayNameLB.hidden                = TRUE;
    _displayedDescriptionTextView.hidden = TRUE;
    _nameEditTextField.hidden            = FALSE;
    _descriptEditTextFeild.hidden        = FALSE;
    _pageTitleLB.text                    = @"Edit task";
    _pageTitleLB.textColor               = [UIColor redColor];
    _switchBtn.hidden                    = TRUE;
    _statusForNextLB.hidden              = TRUE;
    
    _nameEditTextField.text              = _displayNameLB.text;
    _descriptEditTextFeild.text          = _displayedDescriptionTextView.text;
}

-(void) saveEditTask{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Edit Task" message:@"Are you sure, u will edit this task" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction * Submit = [UIAlertAction actionWithTitle:@"submit" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSMutableArray <ToDoList*>* firstArray  = [[NSMutableArray alloc]init];
        NSInteger i = 0;
        NSString * strStage;
        if([self->_nextStageID isEqual:@"InProg"]){
            strStage = @"toDoList";
        }else if([self->_nextStageID isEqual:@"IsDone"]){
            strStage = @"toDoListInProgress";
        }
        [NSUserDefaults retrieveUserDefualts:firstArray ForKey:strStage];
        for(i=0;i<[firstArray count];i++){
            if ([[firstArray objectAtIndex:i].name isEqual:[self->_toDoObj name]]) {
                break;
            }
        }
        self->_toDoObj.name     = self->_nameEditTextField.text;
        self->_toDoObj.date     = self->_displayedDate.date;
        self->_toDoObj.endDate  = self->_displayedEndDate.date;
        self->_toDoObj.priority = self->_displayPrioritySegment.selectedSegmentIndex;
        self->_toDoObj.descript = self->_descriptEditTextFeild.text;
        [firstArray replaceObjectAtIndex:i withObject:self->_toDoObj];
        [NSUserDefaults updateUserDefaults:firstArray ForKey:strStage];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancel];
    [alert addAction:Submit];
    [self presentViewController:alert animated:YES completion:nil];
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

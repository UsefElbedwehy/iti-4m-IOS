//
//  DisplayViewController.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "ViewController.h"
#import "ToDoList.h"
#import "InProgressDelegete.h"
#import "IsDoneDelegete.h"
NS_ASSUME_NONNULL_BEGIN

@interface DisplayViewController : UIViewController
@property ToDoList * toDoObj;
@property id<InProgressDelegete> inProgDelegete;
@property id<IsDoneDelegete> IsDoneDelegete;
@property NSString * nextStageID;
@end

NS_ASSUME_NONNULL_END

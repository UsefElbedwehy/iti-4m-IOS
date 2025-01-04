//
//  ToDoViewController.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <UIKit/UIKit.h>
#import "MyDelegete.h"
NS_ASSUME_NONNULL_BEGIN

@interface ToDoViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource ,MyDelegete>

@end

NS_ASSUME_NONNULL_END

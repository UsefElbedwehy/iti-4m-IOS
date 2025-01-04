//
//  InProgressViewController.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <UIKit/UIKit.h>
#import "IsDoneDelegete.h"
NS_ASSUME_NONNULL_BEGIN

@interface InProgressViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource,IsDoneDelegete>

@end

NS_ASSUME_NONNULL_END

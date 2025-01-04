//
//  AddViewController.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <UIKit/UIKit.h>
#import "MyDelegete.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

@property id<MyDelegete> delegete;

@end

NS_ASSUME_NONNULL_END

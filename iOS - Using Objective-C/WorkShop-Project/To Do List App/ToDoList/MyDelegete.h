//
//  MyDelegete.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <Foundation/Foundation.h>
#import "ToDoList.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MyDelegete <NSObject>
-(void) addTaskToTable:(ToDoList*) list;
@end

NS_ASSUME_NONNULL_END

//
//  ToDoList.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDoList : NSObject <NSSecureCoding>
@property NSString * name;
@property NSString * descript;
@property NSInteger  priority;
@property NSDate   * date;
@property NSDate   * endDate;
-(void) setWithObject:(ToDoList*) srcObj;
@end

NS_ASSUME_NONNULL_END

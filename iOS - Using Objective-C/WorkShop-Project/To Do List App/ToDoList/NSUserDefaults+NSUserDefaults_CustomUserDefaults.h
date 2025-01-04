//
//  NSUserDefaults+NSUserDefaults_CustomUserDefaults.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <Foundation/Foundation.h>
#import "ToDoList.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (NSUserDefaults_CustomUserDefaults)
-(void) setCustomObject:(ToDoList *) object forKey: (NSString *) key;
-(ToDoList *) customObjectForKey:(NSString *) key;

+(void) updateUserDefaults:(NSMutableArray*) tasksArr ForKey : (NSString* ) key;
+(void) addToUserDefualts:(ToDoList *) obj WithArray :(NSMutableArray*) tasksArr;
+(void) retrieveUserDefualts:(NSMutableArray*) tasksArr ForKey : (NSString* ) key;

+(void) removeObjectFromArray:(NSMutableArray<ToDoList*>*) arr ByString:(NSString*) str;
+(void) convertArray:(NSMutableArray<ToDoList*>*) masterArray ToThreePrioArrWithHighArr:(NSMutableArray<ToDoList*>*) high andMidArr:(NSMutableArray<ToDoList*>*) mid andLowArr:(NSMutableArray<ToDoList*>*) low;
@end

NS_ASSUME_NONNULL_END

//
//  NSUserDefaults+NSUserDefaults_CustomUserDefaults.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "NSUserDefaults+NSUserDefaults_CustomUserDefaults.h"
//------priority macros-------------
#define HIGH_PRIO 0
#define MID_PRIO  1
#define LOW_PRIO  2
//----------------------------------
@implementation NSUserDefaults (NSUserDefaults_CustomUserDefaults)

- (void)setCustomObject:(nonnull ToDoList *)object forKey:(nonnull NSString *)key {
    NSData * encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object requiringSecureCoding:YES error:nil];
    [self setObject:encodedObject forKey:key];
}

- (nonnull ToDoList *)customObjectForKey:(nonnull NSString *)key {
    NSData * encodedObject = [self objectForKey:key];
    if(encodedObject){
        return [NSKeyedUnarchiver unarchivedObjectOfClass:[ToDoList class] fromData:encodedObject error:nil];
    }
    return nil;
}


+(void) updateUserDefaults:(NSMutableArray*) tasksArr ForKey : (NSString* ) key{
    NSData * encodedList = [NSKeyedArchiver archivedDataWithRootObject:tasksArr requiringSecureCoding:YES error:nil];
    if (encodedList) {
        [[NSUserDefaults standardUserDefaults]  setObject:encodedList forKey:key];
    }
}

+(void) addToUserDefualts:(ToDoList *) obj WithArray :(NSMutableArray*) tasksArr{
    [tasksArr addObject:obj];
}

+(void) retrieveUserDefualts:(NSMutableArray*) tasksArr ForKey : (NSString* ) key{
    NSData *retrievedData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (retrievedData) {
        NSArray<ToDoList *> *retrievedToDoList =  [NSKeyedUnarchiver unarchiveObjectWithData:retrievedData];
        [tasksArr removeAllObjects];
        [tasksArr addObjectsFromArray:retrievedToDoList];
    }
}
+(void) removeObjectFromArray:(NSMutableArray<ToDoList*>*) arr ByString:(NSString*) str{
    int i=0;
    for(i=0;i<[arr count];i++){
        if([str isEqual: ([arr objectAtIndex:i].name)]){
            [arr removeObjectAtIndex:i];
        }
    }
}

+(void) convertArray:(NSMutableArray<ToDoList*>*) masterArray ToThreePrioArrWithHighArr:(NSMutableArray<ToDoList*>*) high andMidArr:(NSMutableArray<ToDoList*>*) mid andLowArr:(NSMutableArray<ToDoList*>*) low{
    [high removeAllObjects];
    [mid removeAllObjects];
    [low removeAllObjects];
    for(int i=0; i<[masterArray count] ;i++){
        switch ([masterArray objectAtIndex:i].priority) {
            case HIGH_PRIO:
                [high addObject:[masterArray objectAtIndex:i]];
                break;
            case MID_PRIO:
                [mid addObject:[masterArray objectAtIndex:i]];
                break;
            case LOW_PRIO:
                [low addObject:[masterArray objectAtIndex:i]];
                break;
        }
    }
}

@end

//
//  ToDoList.m
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import "ToDoList.h"

@implementation ToDoList 

-(instancetype) initWithName : (NSString *) tName nImage:(NSString *) tDesc nRate:(NSDate *) date nTime:(NSDate *) eDate tPriority: (NSInteger ) tPrio {
    self = [super init];
    if(self){
        _name           = tName;
        _descript       = tDesc;
        _date           = date;
        _endDate        = eDate;
        _priority       = tPrio;
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.name       forKey:@"taskName"];
    [coder encodeObject:self.descript   forKey:@"taskDescript"];
    [coder encodeObject:self.date       forKey:@"taskDate"];
    [coder encodeObject:self.endDate    forKey:@"taskEndDate"];
    [coder encodeInteger:self.priority   forKey:@"taskPriority"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder { 
    self = [super init];
    if (self) {
        _name     = [coder decodeObjectForKey:@"taskName"];
        _descript = [coder decodeObjectForKey:@"taskDescript"];
        _date     = [coder decodeObjectForKey:@"taskDate"];
        _endDate  = [coder decodeObjectForKey:@"taskEndDate"];
        _priority = [coder decodeIntegerForKey:@"taskPriority"];
    }
    return self;
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
-(void) setWithObject:(ToDoList*) srcObj{
    [self setName:     srcObj.name    ];
    [self setDate:     srcObj.date    ];
    [self setEndDate:  srcObj.endDate ];
    [self setPriority: srcObj.priority];
    [self setDescript: srcObj.descript];
}
@end

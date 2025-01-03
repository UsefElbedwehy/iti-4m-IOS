//
//  UserData.m
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import "UserData.h"

@implementation UserData
static NSMutableArray * maleColleagueArr;
static NSMutableArray * femaleColleagueArr;

+(NSMutableArray*) getMaleColleagueArray{
    return maleColleagueArr;
}
+(NSMutableArray*) getFemaleColleagueArray;{
    return femaleColleagueArr;
}
- (instancetype)init {
self = [super init];
if (self) {
    maleColleagueArr = [[NSMutableArray alloc] init];
    femaleColleagueArr = [[NSMutableArray alloc] init];
//    _colleagueName = [[NSMutableArray alloc] init];
//    _colleaguePhone = [[NSMutableArray alloc] init];
//    _colleagueAge = [[NSMutableArray alloc] init];
//    _colleagueEmail = [[NSMutableArray alloc] init];
//    _colleagueAddress = [[NSMutableArray alloc] init];
    //_maleColleagueArr = [[NSMutableArray alloc] init];
    //_femaleColleagueArr = [[NSMutableArray alloc] init];
    _colleagueName = [NSUserDefaults standardUserDefaults];
    _colleaguePhone = [NSUserDefaults standardUserDefaults];
    _colleagueAge = [NSUserDefaults standardUserDefaults];
    _colleagueEmail = [NSUserDefaults standardUserDefaults];
    _colleagueAddress = [NSUserDefaults standardUserDefaults];
}
return self;
}
- (void)addUserData:(NSString *)name
                  :(NSString *)phone
                  :(NSString *)age
                  :(NSString *)email
                  :(NSString *)address
                  :(BOOL)isMale {
    if (isMale) {
        [maleColleagueArr addObject:name];
        NSLog(@"Added Male Colleague: %@", name);
    } else {
        [femaleColleagueArr addObject:name];
        NSLog(@"Added Female Colleague: %@", name);
    }
    
    [_colleagueName setObject:_colleagueName forKey:@"name"];
    [_colleaguePhone setObject:_colleaguePhone forKey:@"phone"];
    [_colleagueAge setObject:_colleagueAge forKey:@"age"];
    [_colleagueEmail setObject:_colleagueEmail forKey:@"email"];
    [_colleagueAddress setObject:_colleagueAddress forKey:@"addres"];
}


- (NSUInteger)maleArrCount {
    return [maleColleagueArr count];
}
- (NSUInteger)femaleArrCount {
    return [femaleColleagueArr count];
}




@end

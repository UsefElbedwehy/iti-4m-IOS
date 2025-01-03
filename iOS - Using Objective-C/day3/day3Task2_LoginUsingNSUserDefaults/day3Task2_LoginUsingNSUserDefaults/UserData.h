//
//  UserData.h
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserData : NSObject
@property NSUserDefaults * regUserName;
@property NSUserDefaults * regUserPswd;

@property NSUserDefaults * colleagueName;
@property NSUserDefaults * colleaguePhone;
@property NSUserDefaults * colleagueAge;
@property NSUserDefaults * colleagueEmail;
@property NSUserDefaults * colleagueAddress;
//-----------------------------------------
//@property NSString * colleagueName;
//@property NSString * colleaguePhone;
//@property NSString * colleagueAge;
//@property NSString * colleagueEmail;
//@property NSString * colleagueAddress;
//@property NSMutableArray * colleagueName;
//@property NSMutableArray * colleaguePhone;
//@property NSMutableArray * colleagueAge;
//@property NSMutableArray * colleagueEmail;
//@property NSMutableArray * colleagueAddress;
//@property NSMutableArray * maleColleagueArr;
//@property NSMutableArray * femaleColleagueArr;
+(NSMutableArray*) getMaleColleagueArray;
+(NSMutableArray*) getFemaleColleagueArray;
- (void)addUserData:(NSString *)name
                  :(NSString *)phone
                  :(NSString *)age
                  :(NSString *)email
                  :(NSString *)address
                  :(BOOL)isMale;

- (NSUInteger)maleArrCount;
- (NSUInteger)femaleArrCount;
@end

NS_ASSUME_NONNULL_END

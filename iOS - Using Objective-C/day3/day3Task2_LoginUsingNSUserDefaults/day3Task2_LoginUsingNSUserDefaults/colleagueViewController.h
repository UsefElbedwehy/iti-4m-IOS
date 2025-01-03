//
//  colleagueViewController.h
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import <UIKit/UIKit.h>
#include "UserData.h"

NS_ASSUME_NONNULL_BEGIN

@interface colleagueViewController : UIViewController{
    NSMutableArray * colleagueData;
}
@property UserData * uData;
@property NSString * colleagueName;
@property NSString * colleaguePhone;
@property NSString * colleagueAge;
@property NSString * colleagueEmail;
@property NSString * colleagueAddress;

@end

NS_ASSUME_NONNULL_END

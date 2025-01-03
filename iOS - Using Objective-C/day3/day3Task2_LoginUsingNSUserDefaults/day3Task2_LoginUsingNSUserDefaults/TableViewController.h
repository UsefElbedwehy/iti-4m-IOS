//
//  TableViewController.h
//  day3Task2_LoginUsingNSUserDefaults
//
//  Created by Uef on 20/12/2024.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
NS_ASSUME_NONNULL_BEGIN

@interface TableViewController : UITableViewController
{
//    NSMutableArray * menArray;
//    NSMutableArray * womenArray;
@public
    NSString * bridgeUSerName;
}
@property UserData * uDataInTableV;

@end

NS_ASSUME_NONNULL_END

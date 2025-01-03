//
//  SecondViewController.h
//  day2Task1_Navigator
//
//  Created by Uef on 18/12/2024.
//

#import <UIKit/UIKit.h>
#import "MyDelegete.h"
NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property NSString * labelBridge;
@property NSString * templateText;
@property id<MyDelegete> delegete;
@end

NS_ASSUME_NONNULL_END

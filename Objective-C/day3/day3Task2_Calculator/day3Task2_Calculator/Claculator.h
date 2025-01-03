//
//  Claculator.h
//  day3Task2_Calculator
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Claculator : NSObject
+(float) addFirstOp :(float) x andSecondOp : (float) y;
+(float) subFirstOp :(float) x andSecondOp : (float) y;
+(float) mulipleFirstOp :(float) x andSecondOp : (float) y;
+(float) divideFirstOp :(float) x bySecondOp : (float) y;
+(void) printResult:(float) res;
+(void) displayMenu;
@end

NS_ASSUME_NONNULL_END

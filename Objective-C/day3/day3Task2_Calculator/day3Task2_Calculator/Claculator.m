//
//  Claculator.m
//  day3Task2_Calculator
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import "Claculator.h"

@implementation Claculator
+ (float)divideFirstOp:(float)x bySecondOp:(float)y {
    return  x/y;
}

+ (float)mulipleFirstOp:(float)x andSecondOp:(float)y {
    return  x*y;
}

+ (float)subFirstOp:(float)x andSecondOp:(float)y {
    return  x-y;
}

+ (float)addFirstOp:(float)x andSecondOp:(float)y {
    return  x+y;
}

+ (void)printResult:(float)res {
    printf("Result: %f\n",res);
}

+ (void)displayMenu {
    printf("Choose option you want: \n");
    printf("1) Add \n");
    printf("2) Sub \n");
    printf("3) Mul \n");
    printf("4) Div \n");
    printf("5) Sqr \n");
}
@end

//
//  main.m
//  day2Task3_square
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import <Foundation/Foundation.h>
#import "Square.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printf("Area of square: %d\n",[Square calcAreaWithWidth:12 andHeight:4]);
        
        Square * sq = [[Square alloc] init];
        [sq setWidth:4];
        printf("Area of square: %d\n",[sq printArea]);
        
    }
    return 0;
}

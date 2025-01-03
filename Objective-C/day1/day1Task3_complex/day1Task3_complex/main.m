//
//  main.m
//  day1Task2_complex
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>
#include "complex.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n");
        Complex * cmp1 = [[Complex alloc] init];
        Complex * cmp2 = [[Complex alloc] init];
        Complex * res = [[Complex alloc] init];
        int r1 = 0;
        int i1 = 0;
        printf("Enter real1: ");
        scanf("%d",&r1);
        printf("Enter img1: ");
        scanf("%d",&i1);
        [cmp1 setReal:r1];
        [cmp1 setImg:i1];
        
        printf("Enter real2: ");
        scanf("%d",&r1);
        printf("Enter img2: ");
        scanf("%d",&i1);
        [cmp2 setReal:r1];
        [cmp2 setImg:i1];
        
        res = [cmp2 addComplex:cmp1];
        [res displayComplex];
        
        res = [cmp2 subtractComplex:cmp1];
        [res displayComplex];
        
        
    }
    return 0;
}

//
//  main.m
//  day2Task4_simpleCalculator
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Calculator * cal = [[Calculator alloc] init];
        
        int isExit = 1;
        int userMenuInput=0;
        float firstNum=0;
        float secondNum=0;
        float res=0;
        do{
            printf("Enter the first number: ");
            scanf("%f",&firstNum);
            printf("Enter the second number: ");
            scanf("%f",&secondNum);
            [Calculator displayMenu];
            scanf("%d",&userMenuInput);
            if((userMenuInput > 0 )&&(userMenuInput < 5)){
                switch (userMenuInput) {
                    case 1:
                        res=[Calculator addFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 2:
                        res=[Calculator subFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 3:
                        res=[Calculator mulipleFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 4:
                        res=[Calculator divideFirstOp:firstNum bySecondOp:secondNum];
                        break;
                }
                [Calculator printResult:res];
                printf("1) Enter New 2 numbers \n");
                printf("2) Exit \n");
                scanf("%d",&isExit);
            }else{
                printf("> Invalid choice....please try again..\n");
            }
            
        }while(isExit != 2);
        
    }
    return 0;
}

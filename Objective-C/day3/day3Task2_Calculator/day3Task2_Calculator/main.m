//
//  main.m
//  day3Task2_Calculator
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>
#import "Claculator.h"
#import "Claculator+SquareRoot.h"
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
            [Claculator displayMenu];
            scanf("%d",&userMenuInput);
            if((userMenuInput > 0 )&&(userMenuInput < 6)){
                switch (userMenuInput) {
                    case 1:
                        res=[Claculator addFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 2:
                        res=[Claculator subFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 3:
                        res=[Claculator mulipleFirstOp:firstNum andSecondOp:secondNum];
                        break;
                    case 4:
                        res=[Claculator divideFirstOp:firstNum bySecondOp:secondNum];
                        break;
                    case 5:
                        res=[Claculator squareRoot:firstNum];
                        break;
                }
                [Claculator printResult:res];
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

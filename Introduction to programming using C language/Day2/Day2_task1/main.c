#include <stdio.h>
#include <stdlib.h>

int main()
{
    int inputNumber = 0 ;
    int sumInput = 0 ;

    do{
        printf("Enter the number: ");
        scanf("%d",&inputNumber);
        sumInput = sumInput + inputNumber;
        printf("Exit. Acc is: %d\n",sumInput);
    }while(sumInput < 100);

    printf("Exit. Acc is: %d",sumInput);


    return 0;
}

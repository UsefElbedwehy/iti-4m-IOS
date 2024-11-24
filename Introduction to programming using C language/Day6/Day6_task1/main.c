#include <stdio.h>
#include <stdlib.h>

#include "swap.h"

int main()
{
    int firstVal=11 , secondVal=22;

    printf("Before swap: firstVal = %d , secondVal = %d \n",firstVal,secondVal);
    swapByRefEq(&firstVal,&secondVal);
    printf("After swap: firstVal = %d  , secondVal = %d ",firstVal,secondVal);

    return 0;
}


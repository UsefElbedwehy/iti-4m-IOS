#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

int main()
{
    //write a program to find max and min values of set of numbers using a single dim array (1D)
    int array[SIZE] = {111,21,43,55,66,33,12,909,83,45};
    //  --------------------------------- min-max--------
    int maxNum=0 , minNum=0;
    int firstIterator=0;

    maxNum = array[0];
    minNum = array[0];

    for(firstIterator=0 ; firstIterator < SIZE ; firstIterator++){
        if(array[firstIterator] > maxNum){
            maxNum = array[firstIterator] ;
        }
        if(array[firstIterator] < minNum){
            minNum = array[firstIterator] ;
        }
    }

    for(firstIterator=0 ; firstIterator < SIZE ; firstIterator++){
        printf("array[%d] = %d \n",firstIterator,array[firstIterator]);
    }



    printf("Maximum number = %d\n",maxNum);
    printf("Minimum number = %d\n",minNum);

    return 0;
}

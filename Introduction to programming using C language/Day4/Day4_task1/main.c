#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

int main()
{
    // write to read an array and print it using two for loop

    int firstIterator=0, secondIterator=0;
    int array[SIZE] = {0};
    int rowSize=0 , colSize=0;
    printf("-----------------------------------\n");
    printf("Enter the row size: ");
    scanf("%d",&rowSize);
    printf("Enter the column size: ");
    scanf("%d",&colSize);
    printf("-----------------------------------\n");

    for(firstIterator=0 ; firstIterator < rowSize ; firstIterator++){
        for(secondIterator=0 ; secondIterator < colSize ; secondIterator++){
            printf("Enter array[%d][%d] : ",firstIterator,secondIterator);
            scanf("%d",&array[(firstIterator*colSize)+secondIterator]);
        }
    }
    printf("-----------------------------------\n");
    printf("1D array represented as 2D array: \n");
    printf("-----------------------------------\n");
    for(firstIterator=0 ; firstIterator < rowSize ; firstIterator++){
        for(secondIterator=0 ; secondIterator < colSize ; secondIterator++){
                printf("Enter array[%d][%d] = %d \n",firstIterator,secondIterator,array[(firstIterator*colSize)+secondIterator]);
        }
    }
    printf("-----------------------------------\n");


    return 0;
}

#include <stdio.h>
#include <stdlib.h>

#define ROW_SIZE 3
#define COL_SIZE 4

int main()
{
     //write a program to read matrix 3*4
     //and
     //1- find the sum of each row
     //2- the average of each column

     //matrix 3*4, initialized by zeros
     int matrix34[ROW_SIZE][COL_SIZE] = {0};
     int rowSumArray[ROW_SIZE]={0};
     int colSumArray[COL_SIZE]={0};

     //for loop iterrators
     int firstIterator=0, secondIterator=0;
    printf("----------------------------------------------------------------------\n");
     printf("Enter matrix: \n");
     //read the matrix34 from user
     for(firstIterator=0 ; firstIterator < ROW_SIZE ; firstIterator++){
        for(secondIterator=0 ; secondIterator < COL_SIZE ; secondIterator++){
            printf("array[%d][%d] : ",firstIterator ,secondIterator);
            scanf("%d",&matrix34[firstIterator][secondIterator]);
            //---------------sum of each row------------------------------------
            rowSumArray[firstIterator] += matrix34[firstIterator][secondIterator];
            //-------------------------
            colSumArray[secondIterator] += matrix34[firstIterator][secondIterator];
        }
     }
     printf("----------------------------------------------------------------------\n");
     for(firstIterator=0 ; firstIterator < ROW_SIZE ; firstIterator++){
        for(secondIterator=0 ; secondIterator < COL_SIZE ; secondIterator++){
            printf("array[%d][%d]=%d\t",firstIterator ,secondIterator,matrix34[firstIterator][secondIterator]);
        }
        printf("\n");
     }
    printf("----------------------------------------------------------------------\n");
     printf("Number of rows: %d\n",ROW_SIZE);
     printf("----------------------------------------------------------------------\n");
     //1- find the sum of each row
    for(firstIterator=0 ; firstIterator < ROW_SIZE ; firstIterator++){
            printf("row %d sum = %d\n",firstIterator,rowSumArray[firstIterator]) ;
        }
    printf("----------------------------------------------------------------------\n");
    printf("Number of columns: %d\n",COL_SIZE);
     printf("----------------------------------------------------------------------\n");
     //1- find the sum of each row
    for(secondIterator=0 ; secondIterator < COL_SIZE ; secondIterator++){
            printf("cols %d sum = %d | avg = %f \n",secondIterator,colSumArray[secondIterator],((float)colSumArray[secondIterator]/COL_SIZE)) ;
        }
    printf("----------------------------------------------------------------------\n");

    return 0;
}

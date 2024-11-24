#include <stdio.h>
#include <stdlib.h>

int main()
{
    char userChoice = 0;
    printf("Menu: \n");
    printf("------------- \n");
    printf("a-choice a \n");
    printf("b-choice b \n");
    printf("c-choice c \n");
    printf("------------- \n");
    printf("Enter your choice: ");
    scanf(" %c",&userChoice);

    switch(userChoice){
    case 'a':  printf("Choice a \n");    break;
    case 'b':  printf("Choice b \n");    break;
    case 'c':  printf("Choice c \n");    break;
    default:printf("Wrong choice \n");   break;
    }


    return 0;
}

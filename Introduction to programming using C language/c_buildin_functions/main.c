#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define TERMINATOR                  '\0'
#define INITIAL_ITERATOR_VAL        0
#define INITIAL_COUNTER_VAL         0
#define EQUAL_STRINGS               0
#define NOT_EQUAL_STRINGS           -1
#define IS_EQUAL                     0
#define IS_FIRST_GREATER             1
#define IS_SECOND_GREATER           -1

char charStringLength(char arr[]){
    char iterator = INITIAL_ITERATOR_VAL;
    while(arr[iterator] != TERMINATOR){
        iterator++;
    }
    return iterator;
}

char charCopyString(char dest[],char src[]){
    char destArrLen = charStringLength(src);
    char srcArrLen  = charStringLength(dest);
    char status     = EQUAL_STRINGS;
    char iterator   = INITIAL_ITERATOR_VAL;
    if(destArrLen != srcArrLen){
        status = NOT_EQUAL_STRINGS;
    }else{
        while(src[iterator] != TERMINATOR){
            dest[iterator] = src[iterator];
            iterator++;
        }
        dest[iterator] = TERMINATOR;
    }
    return status;
}

char charCompareStrings(char firstStr[], char secondStr[]){
    char firstStrLen    = charStringLength(firstStr);
    char secondStrLen   = charStringLength(secondStr);
    char matchCounter   = INITIAL_COUNTER_VAL;
    int iterator        = INITIAL_ITERATOR_VAL;
    char matchStat      = IS_EQUAL;

    if(firstStrLen == secondStrLen){
        while(firstStr[iterator] != TERMINATOR){
                if(firstStr[iterator ] == secondStr[iterator ]){
                        matchCounter++;
                }else if(firstStr[iterator ] > secondStr[iterator ]){
                    return IS_FIRST_GREATER;
                }else{
                return IS_SECOND_GREATER;
                }
            iterator++;
        }
    }else if(firstStrLen > secondStrLen){
        matchStat = IS_FIRST_GREATER;
        }else{
        matchStat = IS_SECOND_GREATER;
    }
    return matchStat;
}

char charConcateStrings(char firstStr[], char secondStr[]){
    char firstStrLen = charStringLength(firstStr);
    char iterator = INITIAL_ITERATOR_VAL;

    while(secondStr[iterator] != TERMINATOR){
        firstStr[firstStrLen] = secondStr[iterator];
        firstStrLen++;
        iterator++;
    }
    secondStr[iterator] = TERMINATOR;
}

int main()
{
    char src[12] = "ssd";
    char dest[10] = "Ssd";
    char stat = charCompareStrings(src,dest);
    char stat2 = strcmp(src,dest);
    printf("%d\n",stat);
    printf("%d\n",stat2);
    printf("%s\n",src);
    printf("%s\n",dest);


    return 0;
}

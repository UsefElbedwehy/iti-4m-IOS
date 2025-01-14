#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>
#include <dos.h>
#include <dir.h>
#include "teminal.h"
//---------------------------------
//---------HOT KEYS----------------
//---------------------------------
//---------EXTENDED----------------
#define EXTENDED_KEY        -32
//---------CURSOR-KEYS-------------
#define  HOT_KEY_HOME       73
#define  HOT_KEY_END        81
#define  HOT_KEY_UP         72
#define  HOT_KEY_DOWN       80
#define  HOT_KEY_LEFT       75
#define  HOT_KEY_RIGHT      77
#define  HOT_KEY_SPACE      32
//--------FUNCTION-KEYS-----------
#define  HOT_KEY_INSERT     82
#define  HOT_KEY_ENTER      13
#define  HOT_KEY_ESC        27
#define  HOT_KEY_DELETE     83
#define  HOT_KEY_BCAKSPACE  8  //not EXTENDED_KEY = NORMAL KEY
//--------BORDERS-----------------
#define  MAX_LINE_CHAR      255
#define  MIN_LINE_CHAR      0
//--------POSITIONS---------------
#define  INIT_X_POS         0
#define  INIT_Y_POS         0
#define  ORIGIN_X_POS       0
#define  ORIGIN_Y_POS       0
//--------CURSOR-SHAPES-----------
#define CURSOR_BOX          0
#define CURSOR_LINE         1
//--------OFFSET------------------
#define BACHSPACE_OFFSET    1
//---------------------------------
//---------TERMINAL-STRUCT---------
typedef struct CLI{
    char currentCusrorShape;
    char lineChar[MAX_LINE_CHAR];
    char *head;
    char *tail;
    char *currentPos;
}CLI;
//---------------------------------
//@fn: initTerminal
//@brief: to initialize the terminal struct with the innitial values
//@param[in]: pointer to struct
//@retval: void
void initTerminal(CLI* ter){
    ter->currentCusrorShape = INIT_X_POS;
    ter->head = &ter->lineChar[MIN_LINE_CHAR];
    ter->tail = &ter->lineChar[MIN_LINE_CHAR];
    ter->currentPos = ter->head;
}
//@fn: backspaceChar
//@brief: to delete a char behind the current cursor position
//@param[in]: pointer to struct
//@retval: void
void backspaceChar(CLI* ter){
    int i=0;
    while((ter->lineChar[(ter->currentPos-ter->head)+i]) != '\0'){
        ter->lineChar[(ter->currentPos-ter->head)-BACHSPACE_OFFSET+i] = ter->lineChar[(ter->currentPos-ter->head)+i];
        i++;
        }
        ter->lineChar[(ter->currentPos-ter->head)-BACHSPACE_OFFSET+i] = ter->lineChar[(ter->currentPos-ter->head)+i];
        clearTreminal();
        gotoxy(INIT_X_POS,INIT_Y_POS);
        printf("%s",ter->lineChar);
        ter->currentPos--;
        gotoxy((ter->currentPos-ter->head),INIT_Y_POS);
        ter->tail--;
}
//@fn: deleteChar
//@brief: to delete a char of the current cursor position or after (depend on the insert status)
//@param[in]: pointer to struct
//@retval: void
void deleteChar(CLI* ter){
    int i=0;
    if(ter->currentCusrorShape == CURSOR_LINE){
                    while((ter->lineChar[(ter->currentPos-ter->head)+i]) != '\0'){
                    ter->lineChar[(ter->currentPos-ter->head)+i+1] = ter->lineChar[(ter->currentPos-ter->head)+i+2];
                    i++;
                    }
                    ter->lineChar[(ter->currentPos-ter->head)+i+1] = ter->lineChar[(ter->currentPos-ter->head)+i+2];
                    clearTreminal();
                    gotoxy(ORIGIN_X_POS,ORIGIN_Y_POS);
                    printf("%s",ter->lineChar);
                    gotoxy((ter->currentPos-ter->head),0);
    }else{
                    while((ter->lineChar[(ter->currentPos-ter->head)+i]) != '\0'){
                    ter->lineChar[(ter->currentPos-ter->head)+i] = ter->lineChar[(ter->currentPos-ter->head)+i+1];
                    i++;
                    }
                    ter->lineChar[(ter->currentPos-ter->head)+i] = ter->lineChar[(ter->currentPos-ter->head)+i+1];
                    clearTreminal();
                    gotoxy(ORIGIN_X_POS,ORIGIN_Y_POS);
                    printf("%s",ter->lineChar);
                    gotoxy((ter->currentPos-ter->head),ORIGIN_Y_POS);
    }
    ter->tail--;
}
//@fn: spaceChar
//@brief: to add ' ' in the char line array
//@param[in]: pointer to struct
//@retval: void
void spaceChar(CLI* ter){
                if(ter->lineChar[(ter->currentPos-ter->head)] == '\0'){
                printf("%c",' ');
                ter->lineChar[(ter->currentPos-ter->head)] = ' ';
                ter->lineChar[(ter->currentPos-ter->head)+1] = '\0';
                ter->currentPos++;
                gotoxy((ter->currentPos-ter->head),0);
                }else{
                    //shift ->>>>
                char i=0;
                while((ter->currentPos - ter->head) != ((ter->tail - ter->head)-i)){
                    ter->lineChar[((ter->tail - ter->head)-i+1)] = ter->lineChar[((ter->tail - ter->head)-i)];
                    gotoxy(((ter->tail - ter->head)-i+1),0);
                    printf("%c",ter->lineChar[((ter->tail - ter->head)-i+1)]);
                    i++;
                }
                ter->lineChar[((ter->tail - ter->head)-i+1)] = ter->lineChar[((ter->tail - ter->head)-i)];
                    gotoxy(((ter->tail - ter->head)-i+1),0);
                    printf("%c",ter->lineChar[((ter->tail - ter->head)-i+1)]);
                    i++;
                    gotoxy((ter->currentPos - ter->head),0);
                    ter->lineChar[(ter->currentPos - ter->head)] = ' ' ;
                    printf("%c",ter->lineChar[(ter->currentPos - ter->head)]);
                }
                ter->tail++;
}
//@fn: terminate
//@brief: to terminate
//@param[in]: void
//@retval: void
void terminate(void){
    clearTreminal();
    printf("Terminal closed...bye bye!\n");
}
//@fn: addAndPrintChar
//@brief: to add char to the char line array and print the screen
//@param[in]: char
//@param[in]: pointer to struct
//@retval: void
void addAndPrintChar(char userInput,CLI* ter){
                if(ter->lineChar[(ter->currentPos-ter->head)] == '\0'){
                printf("%c",userInput);
                ter->lineChar[(ter->currentPos-ter->head)] = userInput;
                ter->lineChar[(ter->currentPos-ter->head)+1] = '\0';
                ter->currentPos++;
                gotoxy((ter->currentPos-ter->head),0);
                }else{
                //shift ->>>>
                char i=0;
                while((ter->currentPos - ter->head) != ((ter->tail - ter->head)-i)){
                    ter->lineChar[((ter->tail - ter->head)-i+1)] = ter->lineChar[((ter->tail - ter->head)-i)];
                    gotoxy(((ter->tail - ter->head)-i+1),0);
                    printf("%c",ter->lineChar[((ter->tail - ter->head)-i+1)]);
                    i++;
                }
                ter->lineChar[((ter->tail - ter->head)-i+1)] = ter->lineChar[((ter->tail - ter->head)-i)];
                    gotoxy(((ter->tail - ter->head)-i+1),0);
                    printf("%c",ter->lineChar[((ter->tail - ter->head)-i+1)]);
                    i++;
                    gotoxy((ter->currentPos - ter->head),0);
                    ter->lineChar[(ter->currentPos - ter->head)] = userInput;
                    printf("%c",ter->lineChar[(ter->currentPos - ter->head)]);
                }
                ter->tail++;
}
//@fn: home
//@brief: to move the cursor to the fisrt position
//@param[in]: pointer to struct
//@retval: void
void home(CLI *ter){
    ter->currentPos = ter->head;
                    gotoxy(ORIGIN_X_POS,ORIGIN_Y_POS);
}
//@fn: home
//@brief: to move the cursor to the last position
//@param[in]: pointer to struct
//@retval: void
void end(CLI *ter){
    ter->currentPos = ter->tail;
    gotoxy((ter->tail-ter->head),ORIGIN_Y_POS);
}
//@fn: toggleCursor
//@brief: to toggle the cusrsor shape status
//@param[in]: pointer to struct
//@retval: void
void toggleCursor(CLI *ter){
ter->currentCusrorShape ^= CURSOR_LINE;
}
//@fn: handleLeftArrow
//@brief: to move cursor left
//@param[in]: pointer to struct
//@retval: void
void handleLeftArrow(CLI *ter){
    if((ter->currentPos-ter->head) == ORIGIN_Y_POS){
        ter->currentPos = ter->head;
    }else{
        ter->currentPos--;
        gotoxy((ter->currentPos-ter->head),ORIGIN_Y_POS);
    }
}
//@fn: handleRightArrow
//@brief: to move cursor right
//@param[in]: pointer to struct
//@retval: void
void handleRightArrow(CLI *ter){
    if(ter->currentPos == ter->tail){
        ter->currentPos = ter->tail;
    }else{
        ter->currentPos++;
        gotoxy((ter->currentPos-ter->head),ORIGIN_Y_POS);
    }
}

int main()
{
    char userInput=0;
    CLI ter;
    initTerminal(&ter);
    do{
        userInput = getch();
        //printf("%d",userInput);
        if(userInput != EXTENDED_KEY){ // START: NORMAL KEY
            if(userInput == HOT_KEY_BCAKSPACE){
                backspaceChar(&ter);
            }else if(userInput == HOT_KEY_SPACE){
                spaceChar(&ter);
            }else{
                addAndPrintChar(userInput,&ter);
            }
        }// END: NORMAL KEY
        else if(userInput == EXTENDED_KEY){ // START: EXTENDED KEY
            userInput = getch();
            //printf("%d",userInput);
            switch(userInput){
            case HOT_KEY_RIGHT:
                handleRightArrow(&ter);
                break;
            case HOT_KEY_LEFT:
                handleLeftArrow(&ter);
                break;
            case HOT_KEY_DELETE:
                deleteChar(&ter);
                break;
            case HOT_KEY_INSERT:
                toggleCursor(&ter);
                break;
            case HOT_KEY_HOME:
                    home(&ter);
                break;
            case HOT_KEY_END:
                    end(&ter);
                break;
            }
        }// END: EXTENDED KEY
    }while(userInput != HOT_KEY_ESC);
    terminate();

    return 0;
}

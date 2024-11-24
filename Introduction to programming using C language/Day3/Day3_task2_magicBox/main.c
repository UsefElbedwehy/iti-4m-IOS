#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>
#include <dos.h>
#include <dir.h>

//---------BOOLEAN-------------
#define TRUE  1
#define FALSE 0
//---------COLORS----------------
#define BLUE 9
#define WHITE 15
//---------X-POSITIONS-----------
#define X_POS_OFFSET   20    // ------>
#define X_POS_FACTOR   3
//---------Y-POSITIONS-----------
#define Y_POS_OFFSET   10
#define Y_POS_FACTOR   3
//---------DEFAULT VALUES---------
#define DEFAULT_VAL 0
//--------------------------------
#define DELAY_TIME 1000
void SetColor(int ForgC){
     WORD wColor;

      HANDLE hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
      CONSOLE_SCREEN_BUFFER_INFO csbi;

    //We use csbi for the wAttributes word.
     if(GetConsoleScreenBufferInfo(hStdOut, &csbi))
     {
         //Mask out all but the background attribute, and add in the foregournd color
          wColor = (csbi.wAttributes & 0xF0) + (ForgC & 0x0F);
          SetConsoleTextAttribute(hStdOut, wColor);
     }
     return;
 }
  void gotoxy(int x,int y)
 {
   COORD coord={0,0};
   coord.X=x;
   coord.Y=y;
   SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE),coord);
 }
 void clearTreminal(void){
 //Clear Screen
 system("cls");
 }
int main()
{
	int magicIterator=1;
    int magicArea = 0;
    unsigned char magicSize=0;
    unsigned char maxPos=0;
    unsigned char minPos=0;
    unsigned char currentXPos=0;
    unsigned char currentYPos=0;

    printf("----------------------------\n");
    printf("----------MAGIC-BOX---------\n");
    printf("----------------------------\n");
    printf("Enter a number: ");
    scanf("%d",&magicSize);
    maxPos = magicSize;
	magicArea = magicSize * magicSize;
    currentXPos= (magicSize/2) + 1;
	currentYPos= 1;
    int currentXPosFinal = X_POS_OFFSET+(currentXPos*X_POS_FACTOR);
	int currentYPosFinal = Y_POS_OFFSET+(currentYPos*Y_POS_FACTOR);

    if(magicSize != 0){
		//one time check for 1 value as it is a special val should be at top middle
		if(magicIterator == 1){//START: check 1
			// TOP Middle
			gotoxy(currentXPosFinal,currentYPosFinal);
			printf("%d",magicIterator);
		}//END: check 1
        //magic start here
        do{
			// same as delay()
			Sleep(1000);
			if(((magicIterator)%magicSize) != 0){ //START: not divisible by size check
				//  up and <-   ------
				currentXPos++;  //1
				currentYPos--;  //0
				if(currentXPos > maxPos ){
                    currentXPos = 1;
				}
				if(currentYPos == 0 ){
                    currentYPos = maxPos;
				}
				//calculate current x,y positions
				currentXPosFinal = X_POS_OFFSET+(currentXPos*X_POS_FACTOR);
                currentYPosFinal = Y_POS_OFFSET+(currentYPos*Y_POS_FACTOR);
                gotoxy(currentXPosFinal,currentYPosFinal);

			}//END: not divisible by size check
			else{ //START: divisible by size check
				// down
                currentYPos++;
                if(currentYPos > magicSize){
                    currentYPos = 1;
                }
                currentYPosFinal = Y_POS_OFFSET+(currentYPos*Y_POS_FACTOR);
                gotoxy(currentXPosFinal,currentYPosFinal);
                //printf("%d",magicIterator);
			}//END: divisible by size check
			magicIterator++;
            printf("%d",magicIterator);
		}while(magicIterator < magicArea);
    }else{
        printf("Magic box cannot be zero size.");
    }
    gotoxy(currentXPosFinal,(maxPos*Y_POS_FACTOR)+Y_POS_OFFSET);



    return 0;
}

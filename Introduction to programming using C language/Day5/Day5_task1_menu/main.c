#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>
#include <dos.h>
#include <dir.h>

//---------MENU OPTIONS------
#define NEW_OPTION          0
#define DISPLAY_OPTION      1
#define EXIT_OPTION         2
//---------HOT KEYS----------
#define EXTENDED_KEY  -32
#define  HOT_KEY_UP    72
#define  HOT_KEY_DOWN  80
#define  HOT_KEY_LEFT  75
#define  HOT_KEY_RIGHT 77
#define  HOT_KEY_ENTER 13
#define  HOT_KEY_ESC   27
#define  HOT_KEY_BACKSPACE 8
//---------BOOLEAN-------------
#define TRUE  1
#define FALSE 0
//---------MENU_INDEX------------
#define MIN_MENU_INDEX 0
#define MAX_MENU_INDEX 2
//---------COLORS----------------
#define BLUE 9
#define WHITE 15
//---------X-POSITIONS-----------
#define X_FIRST_LEVEL_POS   60
#define X_SECOND_LEVEL_POS  60
#define X_THIRD_LEVEL_POS   60
//---------Y-POSITIONS-----------
#define Y_FIRST_LEVEL_POS   8
#define Y_SECOND_LEVEL_POS  16
#define Y_THIRD_LEVEL_POS   24
//---------DEFAULT VALUES---------
#define DEFAULT_VAL 0
#define DEFAULT_MENU_LEVEL 1
//--------------------------------
#define MAX_EMP_NUMBER 100

#define NEW_EMP_METHOD  0

typedef struct Birthday{
    unsigned char day;
    unsigned char month;
    unsigned int year;
}BD;

typedef struct Employee{
    char name[100];
    unsigned char ID;
    unsigned int salary;
    BD birth;
}Emp;
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
//DISPLAY MENU (HIGHLIGHT: 1st line)
 void firstLine(void){
    clearTreminal();
    gotoxy(X_FIRST_LEVEL_POS,Y_FIRST_LEVEL_POS);
    SetColor(BLUE);
    printf("NEW <\n");
    SetColor(WHITE);
    gotoxy(X_FIRST_LEVEL_POS,Y_SECOND_LEVEL_POS);
    printf("DISPLAY\n");
    gotoxy(X_FIRST_LEVEL_POS,Y_THIRD_LEVEL_POS);
    printf("EXIT\n");
 }
 //DISPLAY MENU (HIGHLIGHT: 2nd line)
  void secondLine(void){
    clearTreminal();
        SetColor(WHITE);
        gotoxy(X_FIRST_LEVEL_POS,Y_FIRST_LEVEL_POS);
    printf("NEW\n");
        SetColor(BLUE);
        gotoxy(X_FIRST_LEVEL_POS,Y_SECOND_LEVEL_POS);
    printf("DISPLAY <\n");
        SetColor(WHITE);
        gotoxy(X_FIRST_LEVEL_POS,Y_THIRD_LEVEL_POS);
    printf("EXIT\n");
 }
 //DISPLAY MENU (HIGHLIGHT: 3srd line)
  void thirdLine(void){
    clearTreminal();
        SetColor(WHITE);
        gotoxy(X_FIRST_LEVEL_POS,Y_FIRST_LEVEL_POS);
    printf("NEW\n");
    gotoxy(X_FIRST_LEVEL_POS,Y_SECOND_LEVEL_POS);
    printf("DISPLAY\n");
        SetColor(BLUE);
        gotoxy(X_FIRST_LEVEL_POS,Y_THIRD_LEVEL_POS);
    printf("EXIT <\n");
        SetColor(WHITE);
 }
//Decide the highlighted option on menu
 void menuDisplay(int iterator){
     switch(iterator){
     case NEW_OPTION    : firstLine();  break;
     case DISPLAY_OPTION: secondLine(); break;
     case EXIT_OPTION   : thirdLine();  break;
     }
 }
 //for key actions
int takeAction(int iterator,Emp *e, int sizeOfStack){
     switch(iterator){
         static EmpCounter=0;
         static displayC=0;
         char userIn='a';
     case NEW_OPTION:
         while((userIn != 'e') && (EmpCounter < sizeOfStack) ){
         clearTreminal();
         gotoxy(0,1);
         printf("adding new emplee: \n");
         printf("Employee name: \n");
         printf("Employee ID: \n");
         printf("Employee salary: \n");
         printf("Employee birthday: DD-MM-YYYY \n");
         gotoxy(15,2);
         scanf("%s",e[EmpCounter].name);
         gotoxy(13,3);
         scanf("%d",&e[EmpCounter].ID);
         gotoxy(17,4);
         scanf("%d",&e[EmpCounter].salary);
         gotoxy(19,5);
         scanf("%d",&e[EmpCounter].birth.day);
         gotoxy(22,5);
         scanf("%d",&e[EmpCounter].birth.month);
         gotoxy(25,5);
         scanf("%d",&e[EmpCounter].birth.year);
         EmpCounter++;
         printf("The new employee have been added to the 'Employees' database successfully!\n");
         printf("To add another employee, Enter 'a' but 'e; for exit: ");
         scanf(" %c",&userIn);
         }
         menuDisplay(NEW_OPTION);
         break;
     case DISPLAY_OPTION:
         do{
        clearTreminal();
         gotoxy(0,1);
         if(EmpCounter != 0){

             printf("Displaying the employee number %d: \n",displayC);
             printf("Employee name: %s\n",e[displayC].name);
             printf("Employee ID: %d\n",e[displayC].ID);
             printf("Employee salary: %d\n",e[displayC].salary);
             printf("Employee %d-%d-%d \n",e[displayC].birth.day,e[displayC].birth.month,e[displayC].birth.year);

         }else{
         printf("There is no any employee to display.\n");
         printf("Please select NEW from menu to add employee \n");
         printf("and try to display again!.\n");
         }
        userIn = getch();
        if(userIn == HOT_KEY_RIGHT){
            if(displayC != (EmpCounter-1)){
                displayC++;
            }
        }else if(userIn == HOT_KEY_LEFT){
            if(displayC != 0){
                displayC--;
            }
        }
         }while(userIn != HOT_KEY_BACKSPACE);
         displayC=0;
         menuDisplay(DISPLAY_OPTION);
         break;
     case EXIT_OPTION:
         clearTreminal();
         gotoxy(DEFAULT_VAL,DEFAULT_VAL);
         printf("EXIT");
         return HOT_KEY_ESC;
         break;
     }
     return DEFAULT_MENU_LEVEL;
}

int main()
{
    char user_input=DEFAULT_VAL;
    char arrowIterrator=DEFAULT_VAL;
    char menuLevel=DEFAULT_MENU_LEVEL;
    int stackSize=0;
    //employee data base:::::::
    //Emp emp[MAX_EMP_NUMBER]={0};
    printf("Enter the stack size: ");
    scanf("%d",&stackSize);
    Emp * emp = (Emp *)malloc(stackSize*sizeof(Emp));
    //Init Menu
    menuDisplay(arrowIterrator);
    //program
    while(user_input != HOT_KEY_ESC){
        //Get input from user (1st byte)
		user_input = getch();
		//printf("%d",user_input);
        //Start of ---EXTENTED-KEY--- SWITCH
        if(user_input == EXTENDED_KEY){
            //Get input from user (2nd byte)
			user_input = getch();
			//switch for 2nd byte
            switch(user_input){
            case HOT_KEY_UP:
                if(arrowIterrator == MIN_MENU_INDEX){
                    arrowIterrator = MAX_MENU_INDEX;
                }else{
                    arrowIterrator--;
                }
                menuDisplay(arrowIterrator);
            break;
            case HOT_KEY_DOWN:
                if(arrowIterrator == MAX_MENU_INDEX){
                    arrowIterrator = MIN_MENU_INDEX;
                }else{
                    arrowIterrator++;
                }
                menuDisplay(arrowIterrator);
            break;
            case HOT_KEY_ENTER:
                takeAction(arrowIterrator,emp,stackSize);
            break;
            }
        }//end of ---EXTENTED-KEY--- SWITCH

		//start of ---NORMAL-KEY--- SWITCH
        switch(user_input){
        case HOT_KEY_ENTER:
                user_input = takeAction(arrowIterrator,emp,stackSize);
                menuLevel++;
            break;
        case HOT_KEY_ESC:
                if(menuLevel!=DEFAULT_VAL){menuLevel--;}
                if(menuLevel == DEFAULT_VAL){
                        //exit
                    user_input = HOT_KEY_ESC;
                    clearTreminal();
                    printf("Exit...");
                }
                else if(menuLevel){
                    user_input = DEFAULT_VAL;
                    menuDisplay(arrowIterrator);
                }
            break;
        }//End of ---NORMAL-KEY--- SWITCH
    }

    return 0;
}

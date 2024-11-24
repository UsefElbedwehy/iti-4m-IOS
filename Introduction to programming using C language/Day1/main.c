//1- include library
#include <stdio.h>
#include <stdio.h>

main() {
    int numi = 10;
    char varc = 'a';
    char user_input;
    float numf = 9.9999;
//1- write a program to test the different format specifier with printf
printf("\n--------First Program: --------");
printf("\nint variable : %d\nfloat variable : %f\nchar variable : %c\n",numi,numf,varc);

//2- write a program to read char from user and print it and print ACSCII code
printf("\n--------Second Program: --------");

printf("\nEnter a letter: ");
scanf("%c",&user_input);
printf("The letter as char is : %c ,\t the letter as ASCII is : %d",user_input,user_input);

//3- write a program to write the hexa and octa of int
printf("\n--------Third Program: --------");
printf("\nint but in hex: 0x%X",numi);
printf("\nint but in octa: %o",numi);

return 0;
}

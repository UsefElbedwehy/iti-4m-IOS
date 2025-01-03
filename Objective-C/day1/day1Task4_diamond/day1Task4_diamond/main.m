//
//  main.m
//  day1Task4_diamond
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i=0,j=0;
        int n=5;
        int mid = n ;
        for(i=0;i<n;i++){
            for(j=0;j<=((n*2)-1);j++){
                if((j < (mid-i)) || (j > (mid+i))){
                    printf(" ");
                }else{
                    printf("*");
                }
            }
            printf("\n");
        }
        for(j=0;j<=((n*2));j++){
            printf("*");
        }
        printf("\n");
        for(i=n-1;i>=0;i--){
            for(j=0;j<=((n*2)-1);j++){
                if((j < (mid-i)) || (j > (mid+i))){
                    printf(" ");
                }else{
                    printf("*");
                }
            }
            printf("\n");
        }
    }
    return 0;
}

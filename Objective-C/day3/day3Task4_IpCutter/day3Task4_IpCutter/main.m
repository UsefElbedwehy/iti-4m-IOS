//
//  main.m
//  day3Task4_IpCutter
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>
#import "IP.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        IP * ip = [[IP alloc] init];
        char myString[16];
        printf("Enter ip address: ");
        scanf("%s",myString);
        [ip inputIP: myString];
        [ip printIP];
        [ip separate];
        [ip printIP];
        [ip printSeparateIP];
        if([ip validateIpSubLength]){
            printf("Valid IP address...\n");
        }else{
            printf("Invalid IP address...\n");
        }
        
        
    }
    return 0;
}

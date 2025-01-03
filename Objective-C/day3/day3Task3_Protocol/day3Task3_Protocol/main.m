//
//  main.m
//  day3Task3_Protocol
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Triangle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a=0 , b=0;
        Rectangle * rec = [[Rectangle alloc] init];
        Triangle * tri = [[Triangle alloc] init];
        printf("====Enter the Rectangle==== \n");
        printf("Enter the height: ");
        scanf("%d",&a);
        printf("Enter the Width: ");
        scanf("%d",&b);
        printf("Rectangle Area: %f\n",[rec clacArea:a:b]);
        printf("====Enter the Triangle==== \n");
        printf("Enter the height: ");
        scanf("%d",&a);
        printf("Enter the Width: ");
        scanf("%d",&b);
        printf("Rectangle Area: %f\n",[tri clacArea:a:b]);
        
        
    }
    return 0;
}

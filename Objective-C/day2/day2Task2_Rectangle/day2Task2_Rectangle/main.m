//
//  main.m
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n");
        Rectangle * RectanglClass = [[Rectangle alloc] init];
        int h=0,w=0;
        printf("Enter width: ");
        scanf("%d",&w);
        printf("Enter height: ");
        scanf("%d",&h);
        [RectanglClass setWidth:w];
        [RectanglClass setHeight:h];

        printf("area: %d \n",[Rectangle calcAreaWithWidth:w andHeight:h]);
        
    }
    return 0;
}

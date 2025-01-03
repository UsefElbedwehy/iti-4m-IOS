//
//  main.m
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>
#import "MyRect.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n");
        MyRect * RectanglClass = [[MyRect alloc] init];
        int h=0,w=0;
        printf("Enter width: ");
        scanf("%d",&w);
        printf("Enter height: ");
        scanf("%d",&h);
        [RectanglClass setWidth:w];
        [RectanglClass setHeight:h];
        
        printf("width: %d \n",[RectanglClass getWidth]);
        printf("height: %d \n",[RectanglClass getHeight]);
        printf("area: %d \n",[RectanglClass printArea]);
        printf("Enter new width: ");
        scanf("%d",&w);
        printf("Enter new height: ");
        scanf("%d",&h);
        printf("area: %d \n",[MyRect calcAreaWithWidth:w andHeight:h]);
        
    }
    return 0;
}

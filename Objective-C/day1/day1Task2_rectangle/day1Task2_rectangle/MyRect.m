//
//  MyRect.m
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import "MyRect.h"

@implementation MyRect


- (int)getHeight {
    return height;
}

- (int)getWidth {
    return width;
}

- (int)printArea {
    return  height*width;
}

- (void)setHeight:(int)h {
    height = h;
}

- (void)setWidth:(int)w {
    width = w;
}

+ (int)calcAreaWithWidth:(int)w andHeight:(int)h {
    return w*h;
}

@end

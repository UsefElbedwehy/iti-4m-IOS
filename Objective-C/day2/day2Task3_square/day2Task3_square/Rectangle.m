//
//  MyRect.m
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import "Rectangle.h"

@implementation Rectangle


- (int)printArea {
    return  _height*_width;
}

+ (int)calcAreaWithWidth:(int)w andHeight:(int)h {
    return w*h;
}

@end

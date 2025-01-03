//
//  Square.m
//  day2Task3_square
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import "Square.h"

@implementation Square

+(int) calcAreaWithWidth :(int) w andHeight: (int) h{
    return w*w;
}

- (int)printArea {
    return width*width;
}

- (void)setWidth:(int)w {
    width = w;
}

- (int)getWidth {
    return width;
}

@end

//
//  Square.h
//  day2Task3_square
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
NS_ASSUME_NONNULL_BEGIN

@interface Square : Rectangle{
    int width;
}
-(void) setWidth :(int) w;
-(int) getWidth;
-(int) printArea;
+(int) calcAreaWithWidth :(int) w andHeight: (int) h;

@end

NS_ASSUME_NONNULL_END

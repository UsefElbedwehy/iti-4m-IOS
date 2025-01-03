//
//  MyRect.h
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyRect : NSObject{
    int width;
    int height;
}
-(void) setWidth:(int) w;
-(void) setHeight:(int) h;

-(int) getWidth;
-(int) getHeight;
-(int) printArea;

+(int) calcAreaWithWidth :(int) w andHeight: (int) h;

@end


NS_ASSUME_NONNULL_END

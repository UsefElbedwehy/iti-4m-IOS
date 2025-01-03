//
//  MyRect.h
//  day1Task2_rectangle
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject{
}
@property int width;
@property int height;

-(int) printArea;

+(int) calcAreaWithWidth :(int) w andHeight: (int) h;

@end


NS_ASSUME_NONNULL_END

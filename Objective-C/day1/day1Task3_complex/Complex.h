//
//  Complex.h
//  day1Task2_complex
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Complex : NSObject{
    int real;
    int img;
}
-(void) setReal:(int)r;
-(void) setImg:(int)i;
-(int) getImg;;
-(int) getReal;
-(void) displayComplex;
-(Complex*) subtractComplex:(Complex*) cc;
-(Complex*) addComplex:(Complex*) sc;

@end

NS_ASSUME_NONNULL_END

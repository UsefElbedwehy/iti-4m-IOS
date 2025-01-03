//
//  Complex.m
//  day1Task2_complex
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import "Complex.h"

@implementation Complex

- (int)getImg {
    return img;
}

- (void)setImg:(int)i {
    img = i;
}

- (void)setReal:(int)r {
    real = r;
}

- (void)displayComplex {
    printf("Complex: ");
            if((real == 0)&&(img == 0)){
                printf("No data\n");
            }else if((real == 0)&&(img > 0)){
                if((img != 1)){
                    printf("%di",img);
                }else{
                    printf("i");
                }
            }else if((real == 0)&&(img < 0)){
                if((img != -1) ){
                    printf("%di",img);
                }else{
                    printf("-i");
                }
            }else if((real != 0)){
                if(img == 1){
                    printf("%d+i",real);
                }else if(img == -1){
                    printf("%d-i",real);
                }else if(img > 0){
                    printf("%d+%di",real,img);
                }else{
                    printf("%d-%di",real,img);
                }
                
            }
    printf("\n");
}

- (int)getReal {
    return real;
}

- ( Complex *)subtractComplex:( Complex *)cc {
    Complex * tempComplex = [Complex new];
    tempComplex->real = real + cc->real;
    tempComplex->img = img + cc->img;
    return tempComplex;
}

- ( Complex *)addComplex:( Complex *)sc {
    Complex * tempComplex = [Complex new];
    tempComplex->real = real - sc->real;
    tempComplex->img = img - sc->img;
    return tempComplex;
}

@end

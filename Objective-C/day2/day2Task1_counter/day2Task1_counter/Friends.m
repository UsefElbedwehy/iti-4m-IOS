//
//  Friends.m
//  day2Task1_counter
//
//  Created by JETSMobileLabMini5 on 12/12/2024.
//

#import "Friends.h"

@implementation Friends
    static int counter;

-(instancetype) init{
    if(self == [super init]){
        counter++;
        printf("counter: %d\n",counter);
    }
    return self;
}

    @end
    
    

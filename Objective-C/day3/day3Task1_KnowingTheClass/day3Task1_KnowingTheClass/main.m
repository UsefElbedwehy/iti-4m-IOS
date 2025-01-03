//
//  main.m
//  day3Task1_KnowingTheClass
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>
#import "ClassB.h"
#import "MyClass.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ClassA * objA  = [[ClassA  alloc] init];
        ClassB * objB  = [[ClassB  alloc] init];
        MyClass * objM = [[MyClass alloc] init];
        //
        if([objA isKindOfClass:[ClassA class]]){
            printf("True: objA is kind of ClassA.\n");
        }else{
            printf("False: objA is not kind of ClassA.\n");
        }
        if([objB isKindOfClass:[ClassA class]]){
            printf("True: objB is kind of ClassA.\n");
        }else{
            printf("False: objB is not kind of ClassA.\n");
        }
        if([objM isKindOfClass:[ClassA class]]){
            printf("True: objM is kind of ClassA.\n");
        }else{
            printf("False: objM is not kind of ClassA.\n");
        }
        //
        if([objA isKindOfClass:[ClassB class]]){
            printf("True: objA is kind of ClassB.\n");
        }else{
            printf("False: objA is not kind of ClassB.\n");
        }
        if([objB isKindOfClass:[ClassB class]]){
            printf("True: objB is kind of ClassB.\n");
        }else{
            printf("False: objB is not kind of ClassB.\n");
        }
        if([objM isKindOfClass:[ClassB class]]){
            printf("True: objM is kind of ClassB.\n");
        }else{
            printf("False: objM is not kind of ClassB.\n");
        }
        //
        if([objA isKindOfClass:[MyClass class]]){
            printf("True: objA is kind of MyClass.\n");
        }else{
            printf("False: objA is not kind of MyClass.\n");
        }
        if([objB isKindOfClass:[MyClass class]]){
            printf("True: objB is kind of MyClass.\n");
        }else{
            printf("False: objB is not kind of MyClass.\n");
        }
        if([objM isKindOfClass:[MyClass class]]){
            printf("True: objM is kind of MyClass.\n");
        }else{
            printf("False: objM is not kind of MyClass.\n");
        }
        //
        if([objA isMemberOfClass:[ClassA class]]){
            printf("True: objA is Member of ClassA.\n");
        }else{
            printf("False: objA is not Member of ClassA.\n");
        }
        if([objB isMemberOfClass:[ClassA class]]){
            printf("True: objB is Member of ClassA.\n");
        }else{
            printf("False: objB is not Member of ClassA.\n");
        }
        if([objM isMemberOfClass:[ClassA class]]){
            printf("True: objM is Member of ClassA.\n");
        }else{
            printf("False: objM is not Member of ClassA.\n");
        }
        //
        if([objA isMemberOfClass:[ClassB class]]){
            printf("True: objA is Member of ClassB.\n");
        }else{
            printf("False: objA is not Member of ClassB.\n");
        }
        if([objB isMemberOfClass:[ClassB class]]){
            printf("True: objB is Member of ClassB.\n");
        }else{
            printf("False: objB is not Member of ClassB.\n");
        }
        if([objM isMemberOfClass:[ClassB class]]){
            printf("True: objM is Member of ClassB.\n");
        }else{
            printf("False: objM is not Member of ClassB.\n");
        }
        //
        if([objA isMemberOfClass:[MyClass class]]){
            printf("True: objA is Member of MyClass.\n");
        }else{
            printf("False: objA is not Member of MyClass.\n");
        }
        if([objB isMemberOfClass:[MyClass class]]){
            printf("True: objB is Member of MyClass.\n");
        }else{
            printf("False: objB is not Member of MyClass.\n");
        }
        if([objM isMemberOfClass:[MyClass class]]){
            printf("True: objM is Member of MyClass.\n");
        }else{
            printf("False: objM is not Member of MyClass.\n");
        }
        
        //
        if([objA respondsToSelector:@selector(methodA)]){
            printf("True: objA is respondsToSelector of ClassA.\n");
        }else{
            printf("False: objA is not respondsToSelector of ClassA.\n");
        }
        if([objB respondsToSelector: @selector(methodA)]){
            printf("True: objB is Member of ClassA.\n");
        }else{
            printf("False: objB is not Member of ClassA.\n");
        }
        if([objM respondsToSelector:@selector(methodA)]){
            printf("True: objM is Member of ClassA.\n");
        }else{
            printf("False: objM is not Member of ClassA.\n");
        }
        //
        if([objA respondsToSelector:@selector(methodB)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        if([objB respondsToSelector:@selector(methodB)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        if([objM respondsToSelector:@selector(methodB)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        //
        if([objA respondsToSelector:@selector(myMethod)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        if([objB respondsToSelector:@selector(myMethod)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        if([objM respondsToSelector:@selector(myMethod)]){
            printf("True.\n");
        }else{
            printf("False.\n");
        }
        
        
        
        
    }
    return 0;
}

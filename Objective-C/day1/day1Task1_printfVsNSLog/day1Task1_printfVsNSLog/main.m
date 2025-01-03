//
//  main.m
//  day1Task1_printfVsNSLog
//
//  Created by JETSMobileLabMini5 on 11/12/2024.
//

#import <Foundation/Foundation.h>
// Custom class to demonstrate object logging
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *name;
- (instancetype)initWithName:(NSString *)name;
@end

@implementation MyClass
- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"MyClass: %@", self.name];
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"NSlog: Hello, World!");
        NSLog(@"NSlog: Hello, World!");
        printf("printf: Hello, World!\n");
        printf("printf: Hello, World!\n");
        NSLog(@"NSlog: Hello, World!");
        printf("printf: Hello, World!\n");
        printf("printf: Hello, World!\n");
        
        // 1. `printf` Example: Simple data types
        int age = 30;
        float height = 5.9;
        printf("Age: %d\n", age);
        printf("Height: %.2f\n", height);
        
        // 2. `NSLog` Example: String formatting
        NSString *message = @"Hello, Objective-C!";
        NSLog(@"%@", message);  // Will print with a timestamp
        
        // 3. `printf` with objects (only address printed)
        MyClass *myObject = [[MyClass alloc] initWithName:@"John"];
        printf("Object address: %p\n", myObject); // Prints memory address of the object
        
        // 4. `NSLog` with objects (prints the description method)
        NSLog(@"Object details: %@", myObject); // Will print "MyClass: John"
        
        // 5. Performance testing (start time with printf and NSLog)
        NSDate *start = [NSDate date];
        for (int i = 0; i < 12; i++) {
            printf("Processing %d...\n", i);  // printing many lines with printf
        }
        NSTimeInterval timeElapsed = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Time taken with printf: %f seconds", timeElapsed);
        
        start = [NSDate date];
        for (int i = 0; i < 12; i++) {
            NSLog(@"Processing %d...", i);  // printing many lines with NSLog
        }
        timeElapsed = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"Time taken with NSLog: %f seconds", timeElapsed);
        
    }
    return 0;
}

        


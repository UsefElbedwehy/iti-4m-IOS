//
//  IP.h
//  day3Task4_IpCutter
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IP : NSObject{
    NSString * strIP;
    NSArray <NSString *> * strArray;
}
-(void) inputIP:(char*) s;
-(void) printIP;
-(void) separate;
-(void) printSeparateIP;
-(char) validateIpLength;
-(char) validateIpSubLength;
-(char) validateIpSubSize;
@end

NS_ASSUME_NONNULL_END

//
//  MyProtocol.h
//  day3Task3_Protocol
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyProtocol <NSObject>
@required
-(double)clacArea:(double)a :(double)b;
@optional
-(void)printShapeName:(NSString*) str;

@end

NS_ASSUME_NONNULL_END

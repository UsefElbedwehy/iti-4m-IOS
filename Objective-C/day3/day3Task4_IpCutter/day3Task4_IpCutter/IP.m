//
//  IP.m
//  day3Task4_IpCutter
//
//  Created by JETSMobileLabMini5 on 15/12/2024.
//

#import "IP.h"
#define VALIDE_SUB_IP_LENGTH    1
#define INVALIDE_SUB_IP_LENGTH  0
#define MAX_SUB_IP_PARTS        4
@implementation IP

- (void)inputIP:(char *) s {
    strIP = [NSString stringWithCString: s encoding: NSASCIIStringEncoding];
}

- (void)printIP {
    NSLog(@"ip address : %@",strIP);
}

- (void)separate {
    strArray = [strIP componentsSeparatedByString:@"."];
}


- (void)printSeparateIP {
    if((int)[strArray count] <= 4){
    for(int i=0;i<4;i++){
            NSLog(@"%@",strArray[i]);
        }
    }
}

- (char)validateIpSubLength {
    char validCount = 0;
    for(int i=0;i<MAX_SUB_IP_PARTS;i++){
        if(((int)[strArray[i] length] > 0 ) && ((int)[strArray[i] length] < MAX_SUB_IP_PARTS )){
            validCount++;
        }
    }
    if(validCount != MAX_SUB_IP_PARTS){
        return INVALIDE_SUB_IP_LENGTH;
    }
    return VALIDE_SUB_IP_LENGTH;
}

- (char)validateIpSubSize {
    return 0;
}

- (char)validateIpLength {
    return 0;
}

@end

//
//  InProgressDelegete.h
//  ToDoList
//
//  Created by Uef on 30/12/2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InProgressDelegete <NSObject>
-(void) addToInProgress : (NSString *) strName;
@end

NS_ASSUME_NONNULL_END

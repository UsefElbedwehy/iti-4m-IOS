//
//  ViewController.h
//  day5Task1_SynchAsynch
//
//  Created by Uef on 23/12/2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate , NSURLConnectionDataDelegate>
//@property NSURL * url;
@property NSURLRequest * request;
@property NSMutableData * myData;
@property NSURL * facebookUrl;

@end


//
//  ViewController.h
//  day5Task2_RegisterUsingWebService
//
//  Created by Uef on 23/12/2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>
@property NSString * strUrl;

@property NSMutableData     * myData;
@property NSMutableString   * myStr;
@property NSURL             * url;
@property NSURLRequest      * request;
@property NSURLConnection   * connection;
//
@property NSMutableDictionary   * myDic;
@property NSMutableArray        * myArr;

@end


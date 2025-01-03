//
//  SecondViewController.m
//  day5Task1_SynchAsynch
//
//  Created by Uef on 23/12/2024.
//

#import "SecondViewController.h"
#import "WebKit/WebKit.h"
@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *wKVDisplay;
@property (weak, nonatomic) IBOutlet UITextView *txtContentDisplay;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_strSvcData = [NSString new];
    _txtContentDisplay.text = _strSvcData;
    //_wKVDisplay.
    [_wKVDisplay loadHTMLString:_strSvcData baseURL:_sVCUrl];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  day5Task1_SynchAsynch
//
//  Created by Uef on 23/12/2024.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _myData = [NSMutableData new];
    _facebookUrl = [[NSURL alloc] initWithString:@"https://www.facebook.com"];
}
- (IBAction)synch:(id)sender {
    SecondViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    NSString * strMyData = [[NSString alloc] initWithContentsOfURL:_facebookUrl encoding:NSUTF8StringEncoding error:nil];
    [sVC setStrSvcData:strMyData];
    [sVC setSVCUrl:_facebookUrl];
    [self presentViewController:sVC animated:YES completion:nil];
}
- (IBAction)asynch:(id)sender {
    
    NSURL * facebookUrl = [[NSURL alloc] initWithString:@"https://www.facebook.com"];
    _request = [NSURLRequest requestWithURL:facebookUrl];
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    
    [connection start];
    
    }
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_myData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString * tempStr = [[NSString alloc] initWithData:self.myData encoding:NSUTF8StringEncoding];
    SecondViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [sVC setStrSvcData:tempStr];
    [sVC setSVCUrl:_facebookUrl];
    [self presentViewController:sVC animated:YES completion:nil];
}

@end

//
//  ViewController.m
//  day5Task2_RegisterUsingWebService
//
//  Created by Uef on 23/12/2024.
//

#import "ViewController.h"
#import "productDetailsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSNumber * pPrice;
@property NSNumber * pRating;
@property NSString * pDescription;
@property NSString * pTitle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initProduct];
    
    _strUrl = @"https://dummyjson.com/products";
    _url = [[NSURL alloc] initWithString:_strUrl];
    
    
    //conection
    _request = [[NSURLRequest alloc] initWithURL:_url];
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    [_connection start];
    
    
}
-(void) initProduct{
    _myData         = [[NSMutableData alloc] init];
    _myStr          = [[NSMutableString alloc] init];
    _myDic          = [[NSMutableDictionary alloc] init];
    _myArr          = [[NSMutableArray alloc] init];
    _pPrice         = [[NSNumber alloc] init];
    _pRating        = [[NSNumber alloc] init];
    _pDescription   = [[NSString alloc] init];
    _pTitle         = [[NSString alloc] init];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self myArr] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Product title";
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSDictionary * dic = [[NSDictionary alloc] init];
    dic = _myArr[indexPath.row];
    cell.textLabel.text = [dic valueForKey:@"title"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    productDetailsViewController * sVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    NSDictionary * dic = [[NSDictionary alloc] init];
    dic = _myArr[indexPath.row];
    [sVC setProductPrice:[dic valueForKey:@"price"]];
    [sVC setProductRating:[dic valueForKey:@"rating"]];
    [sVC setProductDescription:[dic valueForKey:@"description"]];
    [sVC setProductTitle:[dic valueForKey:@"title"]];
    NSLog(@"%@\n%@\n%@\n---%@\n",[dic valueForKey:@"price"],[dic valueForKey:@"rating"],[dic valueForKey:@"description"],[dic valueForKey:@"title"]);
    [self.navigationController pushViewController:sVC animated:YES];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertController * WarningAlert = [UIAlertController alertControllerWithTitle:@"Connection Failed!" message:@"Conection failed...cancel or ty again." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction * tryagainAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:nil];
    [WarningAlert addAction:okAction];
    [WarningAlert addAction:tryagainAction];
    [self presentViewController:WarningAlert animated:YES completion:nil];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_myData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    _myDic = [NSJSONSerialization JSONObjectWithData:_myData options:NSJSONReadingAllowFragments error:nil];
    _myArr = [_myDic mutableArrayValueForKey:@"products"];
    
    [self.myTableView reloadData];
    UIAlertController * WarningAlert = [UIAlertController alertControllerWithTitle:@"Connection successed!" message:@"Conection successed. choose okay an have fun!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [WarningAlert addAction:okAction];
    [self presentViewController:WarningAlert animated:YES completion:nil];
}

@end

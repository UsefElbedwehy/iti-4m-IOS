//
//  productDetailsViewController.m
//  day5Task2_RegisterUsingWebService
//
//  Created by Uef on 24/12/2024.
//

#import "productDetailsViewController.h"
#import <SDWebImage/SDWebImage.h>
#import "Cosmos/Cosmos-Swift.h"
@interface productDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionLB;
@property (weak, nonatomic) IBOutlet UILabel *priceLB;
@property (weak, nonatomic) IBOutlet UILabel *ratingLB;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UIImageView *pImage;
@property (weak, nonatomic) IBOutlet CosmosView *cosmosView;

@end

@implementation productDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _descriptionLB.text = _productDescription;
    _priceLB.text       = _productPrice.stringValue;
//    _ratingLB.text      = _productRating.stringValue;
    _cosmosView.rating = _productRating.doubleValue;
    _titleLB.text        = _productTitle;
    [_pImage sd_setImageWithURL:[NSURL URLWithString:@"https://images.contentstack.io/v3/assets/bltcedd8dbd5891265b/bltde5e489dacb893de/66707e17822a0d29aded310b/breakfast-meat-spread.jpg?q=70&width=3840&auto=webp"]
                                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    NSLog(@"fromSVC%@\n%@\n%@\n---%@\n",_productDescription,_productPrice.stringValue,_productRating.stringValue,_productTitle);
    
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

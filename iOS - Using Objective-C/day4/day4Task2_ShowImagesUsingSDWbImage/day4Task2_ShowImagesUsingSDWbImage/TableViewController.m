//
//  TableViewController.m
//  day4Task2_ShowImagesUsingSDWbImage
//
//  Created by Uef on 23/12/2024.
//

#import "TableViewController.h"
#import "SDWebImage/SDWebImage.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _sdwebImagesArr = [[NSMutableArray alloc] initWithObjects:@"https://encrypted-tbn0.gstatic.com/images?q=tbn:&",@"https://cdn.pixabay.com/photo/2024/04/21/09/30/ai-generated-8710183_640",@"https://t3.ftcdn.net/jpg/07/05/94/16/360_F_705941690_ny3xJEDtGPnOulu3gMiWgmToRRd5JMPR.jpg",@"https://t3.ftcdn.net/jpg/07/30/35/84/360_F_730358433_DvKBqD6osW1hPUxDqyaJ1oZPU4TBDkeZ.jpg",@"https://t4.ftcdn.net/jpg/07/11/80/23/240_F_711802389_dzxxAGGOMVzun0QVr6ngCv50Flu91Ght.jpg",@"https://punnyhub.com/wp-content/uploads/2024/08/Ninja-Turtle-Jokes-and-Puns_1-768x768.webp", nil];
    _rawImagesArr = [[NSMutableArray alloc]  initWithObjects:@"img.jpeg",@"img.jpeg",@"img.jpeg",@"img.jpeg",@"img.jpeg",@"img.jpeg", nil];
    _labelImagesArr = [[NSMutableArray alloc]  initWithObjects:@"Panda",@"frog",@"super meo",@"koki",@"rabbit",@"turtle", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
// set title of section here
    NSString * sectionName = @"Animals";
    return sectionName; //set the title of each section as a date
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_labelImagesArr objectAtIndex:indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_sdwebImagesArr objectAtIndex:indexPath.row]]
                  placeholderImage:[UIImage imageNamed:@"img.jpeg"]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

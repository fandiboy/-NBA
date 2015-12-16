//
//  TeamTableViewController.m
//  掌上NBA
//
//  Created by fandi on 15/11/20.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "TeamTableViewController.h"
#import "TeamTableViewCell.h"
#import "TeamDataManager.h"
#import "TeamModel.h"

@interface TeamTableViewController ()

@property (nonatomic, strong) TeamDataManager *teamDataManger;

@end

@implementation TeamTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:@"TeamTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.teamDataManger = [TeamDataManager new];
    [self.teamDataManger dataParse];
    
    __block typeof(self) temp = self;
    self.teamDataManger.myBlock = ^{
        
        [temp.tableView reloadData];
        
    };
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _teamDataManger.eastArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        TeamModel *teamModel = [TeamModel new];
        teamModel = _teamDataManger.eastArray[indexPath.row];
        cell.models = teamModel;
        cell.label4Number.text = [NSString stringWithFormat:@"%d",indexPath.row + 1];
    }else{
        TeamModel *teamModel = [TeamModel new];
        teamModel = _teamDataManger.westArray[indexPath.row];
        cell.models = teamModel;
        cell.label4Number.text = [NSString stringWithFormat:@"%d",indexPath.row + 1];
        
    }
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 25;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width - 25, 25)];
    customView.backgroundColor = [UIColor colorWithWhite:0.853 alpha:1.000];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.textAlignment = NSTextAlignmentLeft;
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:15];
    headerLabel.frame = CGRectMake(10, 0, 100, 25);
    
    UILabel *headerLabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel2.backgroundColor = [UIColor clearColor];
    headerLabel2.opaque = NO;
    headerLabel2.textColor = [UIColor blackColor];
    headerLabel2.textAlignment = NSTextAlignmentRight;
    headerLabel2.highlightedTextColor = [UIColor whiteColor];
    headerLabel2.font = [UIFont boldSystemFontOfSize:15];
    headerLabel2.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 85, 0, 60, 25);
    
    UILabel *headerLabel3 = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel3.backgroundColor = [UIColor clearColor];
    headerLabel3.opaque = NO;
    headerLabel3.textAlignment = NSTextAlignmentCenter;
    headerLabel3.textColor = [UIColor blackColor];
    headerLabel3.highlightedTextColor = [UIColor whiteColor];
    headerLabel3.font = [UIFont boldSystemFontOfSize:15];
    headerLabel3.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 30, 0, 60, 25);
    
    UILabel *headerLabel4 = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel4.backgroundColor = [UIColor clearColor];
    headerLabel4.opaque = NO;
    headerLabel4.textAlignment = NSTextAlignmentCenter;
    headerLabel4.textColor = [UIColor blackColor];
    headerLabel4.highlightedTextColor = [UIColor whiteColor];
    headerLabel4.font = [UIFont boldSystemFontOfSize:15];
    headerLabel4.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 + 30, 0, 60, 25);
    
    if (section == 0) {
        headerLabel.text = @"东部球队";
        headerLabel2.text = @"近况";
        headerLabel3.text = @"胜";
        headerLabel4.text = @"负";
    }else{
        headerLabel.text = @"西部球队";
        headerLabel2.text = @"近况";
        headerLabel3.text= @"胜";
        headerLabel4.text = @"负";
    }
    
    [customView addSubview:headerLabel];
    [customView addSubview:headerLabel2];
    [customView addSubview:headerLabel3];
    [customView addSubview:headerLabel4];
    
    return customView;
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

 //
//  PlayerTableViewController.m
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "PlayerTableViewController.h"
#import "PlayerTableViewCell.h"
#import "PlayerDataManager.h"
#import "Player.h"
#import "PlayerDetailController.h"
#import "groups.h"

@interface PlayerTableViewController ()

@property (nonatomic, strong) groups *group;

@property (nonatomic, strong) PlayerDataManager *playerData;

@end


static NSString *identifier = @"newCell";
@implementation PlayerTableViewController

- (PlayerDataManager *)playerData{
    if (!_playerData) {
        _playerData = [PlayerDataManager new];
    }
    return _playerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayerTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    [self.playerData DataParse];
    
    __block typeof (self)temp = self;
    self.playerData.myBlock = ^{
        
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
    return _playerData.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _playerData.rowArray.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    // NSLog(@"%ld",(long)indexPath.row);
    if ([indexPath row] >= [_playerData.rowArray count]) {
        
        UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        
        newCell.textLabel.text = @"显示全部";
        newCell.textLabel.textAlignment = NSTextAlignmentRight;
        newCell.textLabel.textColor = [UIColor colorWithRed:0.306 green:0.493 blue:0.269 alpha:1.000];
        newCell.textLabel.font = [UIFont systemFontOfSize:15];
        
        return newCell;
        
        
        
    }else{
        
        PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        // Player *player = [Player new];
        NSArray *tempArray = _playerData.modelArray[indexPath.section];
        
        cell.player = tempArray[indexPath.row];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        
        return cell;
    }
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([indexPath row] >= [_playerData.rowArray count]){
        
        // NSArray *array = @[@"pts",@"reb",@"asts",@"stl",@"blk",@"fgp",@"tpp",@"ftp",@"to",@"mins"];
        
        PlayerDetailController *playerDetailVC = [[PlayerDetailController alloc] init];
        if (indexPath.section > -1) {
            
//            NSURL *url = [NSURL URLWithString:@"http://games.mobileapi.hupu.com/nba/getNbaPlayerRank?client=htlm&category=regular&type=pts&rank_type=nba_rank_"];
//            NSString *string = [NSString stringWithFormat:@"%@",url];
            NSString *string2 = [NSString stringWithFormat:@"%@",_playerData.urlArray[indexPath.section]];
            NSLog(@"%@",string2);
            
            // url = [NSURL URLWithString:string2];
            playerDetailVC.url = string2;
        }
        
        [self.navigationController pushViewController:playerDetailVC animated:YES];
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     if ([indexPath row] >= [_playerData.rowArray count]) {
     
         return 35;
     
     }else{
    return 75;
     }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 25;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 350, 25)];
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
    
    if (section >= 0) {
        headerLabel.text = _playerData.nameArray[section];
        headerLabel2.text = @"数据";
    }
    
    [customView addSubview:headerLabel];
    [customView addSubview:headerLabel2];
    
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

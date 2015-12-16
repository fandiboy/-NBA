//
//  PlayerTableViewCell.h
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *label4Rank;


@property (strong, nonatomic) IBOutlet UILabel *label4Player_name;

@property (strong, nonatomic) IBOutlet UILabel *label4Pts;

@property (strong, nonatomic) IBOutlet UILabel *label4Reb;


@property (strong, nonatomic) IBOutlet UILabel *label4Asts;


@property (strong, nonatomic) IBOutlet UILabel *label4Team_name;


@property (strong, nonatomic) IBOutlet UILabel *label4val;

@property (nonatomic, strong) Player * player;

@property (strong, nonatomic) IBOutlet UIImageView *img4heade;

@end

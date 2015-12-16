//
//  MatchTableViewCell.h
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchModels.h"

@interface MatchTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label4LeftName;


@property (strong, nonatomic) IBOutlet UILabel *label4RightName;


@property (strong, nonatomic) IBOutlet UIImageView *img4LeftImg;

@property (nonatomic, strong) MatchModels * models;

@property (strong, nonatomic) IBOutlet UIImageView *img4RightImg;

@property (strong, nonatomic) IBOutlet UILabel *label4quater;

@property (strong, nonatomic) IBOutlet UILabel *label4quarterTime;

@property (strong, nonatomic) IBOutlet UILabel *label4leftGoal;

@property (strong, nonatomic) IBOutlet UILabel *label4rightGoal;

@end

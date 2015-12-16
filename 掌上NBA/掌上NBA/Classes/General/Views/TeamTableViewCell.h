//
//  TeamTableViewCell.h
//  掌上NBA
//
//  Created by fandi on 15/11/19.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamModel.h"

@interface TeamTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *label4Name;


@property (strong, nonatomic) IBOutlet UILabel *label4Win;


@property (strong, nonatomic) IBOutlet UILabel *label4Lost;


@property (strong, nonatomic) IBOutlet UILabel *label4gb;

@property (strong, nonatomic) IBOutlet UILabel *label4Strk;

@property (strong, nonatomic) IBOutlet UILabel *label4Number;
@property (nonatomic, strong) TeamModel * models;


@end

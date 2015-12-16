//
//  NBANewsTableViewCell.h
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModels.h"

@interface NBANewsTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *label4Title;


@property (strong, nonatomic) IBOutlet UILabel *label4Summary;


@property (strong, nonatomic) IBOutlet UIImageView *img4Image;

@property (nonatomic, strong) NewsModels *newsModels;



@end

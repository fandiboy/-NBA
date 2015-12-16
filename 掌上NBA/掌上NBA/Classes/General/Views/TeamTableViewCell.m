//
//  TeamTableViewCell.m
//  掌上NBA
//
//  Created by fandi on 15/11/19.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "TeamTableViewCell.h"

@implementation TeamTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModels:(TeamModel *)models{
    
    _models = models;
    _label4gb.text = [NSString stringWithFormat:@"%d",models.gb];
    _label4Win.text = [NSString stringWithFormat:@"%d",models.win];
    _label4Lost.text = [NSString stringWithFormat:@"%d",models.lost];
    _label4Name.text = models.name;
    _label4Strk.text = models.strk;
    
    
}

@end

//
//  MatchTableViewCell.m
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "MatchTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation MatchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModels:(MatchModels *)models{
    
    _models = models;
    self.label4LeftName.text = models.leftName;
    self.label4quater.text = models.quarter;
    self.label4leftGoal.text = [NSString stringWithFormat:@"%ld",models.leftGoal];
    self.label4rightGoal.text = [NSString stringWithFormat:@"%ld",models.rightGoal];
    self.label4RightName.text = models.rightName;
    self.label4quarterTime.text = models.quarterTime;
    [self.img4LeftImg sd_setImageWithURL:[NSURL URLWithString:models.leftBadge] placeholderImage:[UIImage imageNamed:@"NBA图标256*256PX 2.png"]];
    [self.img4RightImg sd_setImageWithURL:[NSURL URLWithString:models.rightBadge] placeholderImage:[UIImage imageNamed:@"NBA图标256*256PX 2.png"]];
    
}









@end

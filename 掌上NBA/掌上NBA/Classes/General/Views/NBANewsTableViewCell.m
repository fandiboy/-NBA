//
//  NBANewsTableViewCell.m
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "NBANewsTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation NBANewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setNewsModels:(NewsModels *)newsModels{
    
    
    _newsModels = newsModels;
    
    self.label4Title.text = newsModels.title;
    self.label4Summary.text = newsModels.summary;
    [self.img4Image sd_setImageWithURL:[NSURL URLWithString:newsModels.img] placeholderImage:[UIImage imageNamed:@"麦迪.jpg"]];
    
    
}

@end

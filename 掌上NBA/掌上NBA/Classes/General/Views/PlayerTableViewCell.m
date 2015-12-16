//
//  PlayerTableViewCell.m
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "PlayerTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation PlayerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)setPlayer:(Player *)player{
    
    _player = player;
    
    self.label4Rank.text = [NSString stringWithFormat:@"%ld",player.rank];
    self.label4val.text = [NSString stringWithFormat:@"%@",player.val];
    self.label4Pts.text = [NSString stringWithFormat:@"%@分",player.pts];
    self.label4Reb.text = [NSString stringWithFormat:@"%@板",player.reb];
    self.label4Asts.text = [NSString stringWithFormat:@"%@助",player.asts];
    self.label4Player_name.text = player.player_name;
    self.label4Team_name.text = player.team_name;
    [self.img4heade sd_setImageWithURL:[NSURL URLWithString:player.player_header] placeholderImage:[UIImage imageNamed:@"库里1.jpg"]];
}




@end

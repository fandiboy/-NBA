//
//  Player.h
//  掌上NBA
//
//  Created by fandi on 15/11/18.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject




// 球员姓名
@property (nonatomic, strong) NSString *player_name;

// 球员助攻
@property (nonatomic, assign) NSNumber *asts;

// 球员排行
@property (nonatomic, assign) NSInteger rank;

// 球员得分
@property (nonatomic, assign) NSNumber *pts;

// 球员篮板
@property (nonatomic, assign) NSNumber *reb;

// 所属球队
@property (nonatomic, strong) NSString *team_name;

// 球员头像
@property (nonatomic, strong) NSString *player_header;

// 数据
@property (nonatomic, assign) NSNumber *val;





@end

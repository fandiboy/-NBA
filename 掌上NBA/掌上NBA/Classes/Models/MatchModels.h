//
//  MatchModels.h
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MatchModels : NSObject


// 客场队
@property (nonatomic, strong) NSString * leftName;

// 客队分数
@property (nonatomic, assign) NSInteger leftGoal;

// 比赛时间
@property (nonatomic, strong) NSString * startTime;

// 主场队伍
@property (nonatomic, strong) NSString * rightName;

// 主队分数
@property (nonatomic, assign) NSInteger rightGoal;

// 客队logo
@property (nonatomic, strong) NSString * leftBadge;

// 主队logo
@property (nonatomic, strong) NSString * rightBadge;

// 赛事类型
@property (nonatomic, strong) NSString * matchDesc;

// 第几节
@property (nonatomic, strong) NSString * quarter;

// 剩余时间
@property (nonatomic, strong) NSString * quarterTime;







@end

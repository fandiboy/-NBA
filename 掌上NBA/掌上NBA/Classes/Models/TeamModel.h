//
//  TeamModel.h
//  掌上NBA
//
//  Created by fandi on 15/11/19.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamModel : NSObject


// 胜场差
@property (nonatomic, assign) NSInteger gb;

// 队名
@property (nonatomic, strong) NSString *name;

// 战况
@property (nonatomic, strong) NSString *strk;

// 胜场
@property (nonatomic, assign) NSInteger win;

// 败场
@property (nonatomic, assign) NSInteger lost;

// 排名
@property (nonatomic, assign) NSInteger number;






@end

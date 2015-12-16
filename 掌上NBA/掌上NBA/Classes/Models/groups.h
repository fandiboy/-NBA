//
//  groups.h
//  掌上NBA
//
//  Created by fandi on 15/11/19.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface groups : NSObject


// 排行种类
@property (nonatomic, strong) NSString *name;

// 查看更多排行
@property (nonatomic, strong) NSString * allURL;

@property (nonatomic, strong) NSArray * data;

@end

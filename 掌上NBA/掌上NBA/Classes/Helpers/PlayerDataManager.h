//
//  PlayerDataManager.h
//  掌上NBA
//
//  Created by fandi on 15/11/18.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^Block)();

@interface PlayerDataManager : NSObject

@property (nonatomic, strong) NSArray * dataArray;

@property (nonatomic, strong) NSMutableArray * nameArray;

// 最外层数组
@property (nonatomic, strong) NSMutableArray * urlArray;

// 传过去row的数组
@property (nonatomic, strong) NSMutableArray * rowArray;


@property (nonatomic, strong) NSMutableArray * modelArray;

@property (nonatomic, copy) Block myBlock;

- (void)DataParse;

@end

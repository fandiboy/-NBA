//
//  MacthDataManager.h
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^Block)();
@interface MacthDataManager : NSObject


@property (nonatomic, strong) NSMutableArray * dataArray;


- (void)dataParse;

@property (nonatomic, copy) Block myBlock;

@end

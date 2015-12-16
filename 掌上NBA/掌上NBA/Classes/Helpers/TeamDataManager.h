//
//  TeamDataManager.h
//  掌上NBA
//
//  Created by fandi on 15/11/20.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Block)();
@interface TeamDataManager : NSObject


@property (nonatomic, copy) Block myBlock;

- (void)dataParse;

@property (nonatomic, strong) NSMutableArray * eastArray;

@property (nonatomic, strong) NSMutableArray * westArray;

@end

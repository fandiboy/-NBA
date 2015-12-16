//
//  DataManager.h
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^Block)();


@interface DataManager : NSObject

@property (nonatomic, strong) NSMutableArray * dataArray;

@property (nonatomic, strong) NSMutableArray * imgArray;

@property (nonatomic, strong) NSMutableArray * titleArray;

- (void)dataParse;

@property (nonatomic, copy) Block myBlock;



@end

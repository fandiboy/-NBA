//
//  TeamDataManager.m
//  掌上NBA
//
//  Created by fandi on 15/11/20.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "TeamDataManager.h"
#import "AFNetworking.h"
#import "TeamModel.h"

@implementation TeamDataManager
- (NSMutableArray *)eastArray{
    if (!_eastArray) {
        _eastArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _eastArray;
}

- (NSMutableArray *)westArray{
    if (!_westArray) {
        _westArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _westArray;
}



- (void)dataParse{
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:kChartURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            
            
            NSString *html = operation.responseString;
            NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableDictionary *dict2 = dict[@"result"];
            NSArray *array1 = dict2[@"east"];
            for (NSDictionary *dic in array1) {
                TeamModel *model = [TeamModel new];
                [model setValuesForKeysWithDictionary:dic];
                [self.eastArray addObject:model];
            }
            
            // NSLog(@"%ld",_eastArray.count);
            
            NSArray *array2 = dict2[@"west"];
            for (NSDictionary *dic in array2) {
                TeamModel *model = [TeamModel new];
                [model setValuesForKeysWithDictionary:dic];
                [self.westArray addObject:model];
            }
            // NSLog(@"%ld",_westArray.count);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!self.myBlock) {
                    NSLog(@"空空空");
                }else{
                    self.myBlock();
                }
                
                
            });
            
            
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            NSLog(@"失败了");
        }];
        
        
        
        
        
        
    });
    
    
    
    
    
    
}


@end

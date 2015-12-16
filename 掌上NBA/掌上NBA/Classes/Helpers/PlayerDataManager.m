//
//  PlayerDataManager.m
//  掌上NBA
//
//  Created by fandi on 15/11/18.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "PlayerDataManager.h"
#import "AFNetworking.h"
#import "Player.h"
#import "groups.h"

@implementation PlayerDataManager





- (void)DataParse{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        // 1.创建URL
        NSURL *url = [NSURL URLWithString:kPlayerChartURL];
        // 2.创建请求对象
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        // 3.建立会话
        NSURLSession *sesson = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [sesson dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            self.dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];


            

            for (NSDictionary *dict in self.dataArray) {
                NSString *urlString = dict[@"allURL"];
                [self.urlArray addObject:urlString];
                
                NSString *nameString = dict[@"name"];
                [self.nameArray addObject:nameString];

                
                self.rowArray = dict[@"data"];
                NSLog(@"%ld",_rowArray.count);
                
                NSMutableArray *tempArray = [NSMutableArray array];
                
                for (NSDictionary *dic in _rowArray) {
                    Player *player = [Player new];
                    [player setValuesForKeysWithDictionary:dic];
                    [tempArray addObject:player];
                }
                [self.modelArray addObject:tempArray];
                
                
            }
            
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!self.myBlock) {
                    NSLog(@"空空空");
                }else{
                    self.myBlock();
                }
                
            });
        }];
        // 使用resume方法启动任务
        [task resume];
    });
    
}


- (NSMutableArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _nameArray;
}

- (NSMutableArray *)urlArray {
    if (!_urlArray) {
        _urlArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _urlArray;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray arrayWithCapacity:20];
    }
    return _modelArray;
}





@end

//
//  MacthDataManager.m
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "MacthDataManager.h"
#import "AFNetworking.h"
#import "MatchModels.h"

@implementation MacthDataManager



- (void)dataParse{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        // 1.创建URL
        NSURL *url = [NSURL URLWithString:kMacthURL2];
        // 2.创建请求对象
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        // 3.建立会话
        NSURLSession *sesson = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [sesson dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            // NSLog(@"--------%@",dic);
            self.dataArray = [NSMutableArray arrayWithCapacity:50];

            NSDictionary *dict1 = dic[@"data"];
            NSDictionary *dict2 = dict1[@"matches"];
            NSString *string = dict1[@"today"];
            NSDictionary *dict3 = dict2[string];
            NSArray *array1 = dict3[@"list"];
            for (NSDictionary *dic in array1) {
                MatchModels *model = [MatchModels new];
                [model setValuesForKeysWithDictionary:dic[@"matchInfo"]];
                [self.dataArray addObject:model];
                // NSLog(@"%@", model);
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




@end

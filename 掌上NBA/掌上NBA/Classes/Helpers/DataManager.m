//
//  DataManager.m
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "DataManager.h"
#import "AFNetworking.h"
#import "NewsModels.h"

@implementation DataManager



- (void)dataParse{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:kNewsURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            
            self.dataArray = [NSMutableArray arrayWithCapacity:50];
            self.imgArray = [NSMutableArray arrayWithCapacity:50];
            self.titleArray = [NSMutableArray arrayWithCapacity:50];
            NSString *html = operation.responseString;
            NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSMutableDictionary *dict2 = dict[@"result"];
            // NSLog(@"获取到的数据为：%@",dict2);
            NSArray *array = dict2[@"data"];
            // NSLog(@"------%@",array);
            for (NSDictionary *dic in array) {
                
                NSString *imgString = dic[@"img"];
                [self.imgArray addObject:imgString];
                
                NSString *titleString = dic[@"title"];
                [self.titleArray addObject:titleString];
                
                NewsModels *models = [NewsModels new];
                [models setValuesForKeysWithDictionary:dic];
                // NSLog(@"%@",models);
                
                [self.dataArray addObject:models];
                NSLog(@"%@",_imgArray);

            }
            
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

//
//  NewsDetailModel.m
//  掌上NBA
//
//  Created by fandi on 15/11/18.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "NewsDetailModel.h"

@implementation NewsDetailModel

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    NSLog(@"%@--%@", key, [value class]);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end

//
//  NewsModels.m
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "NewsModels.h"

@implementation NewsModels


- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    NSLog(@"%@--%@", key, [value class]);
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}




@end

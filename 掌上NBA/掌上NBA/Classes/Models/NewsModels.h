//
//  NewsModels.h
//  掌上NBA
//
//  Created by fandi on 15/11/17.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModels : NSObject


// 新闻列表图片
@property (nonatomic, strong) NSString * img;

@property (nonatomic, strong) NSString *img_m;

// 新闻列表新闻id
@property (nonatomic, assign) NSInteger nid;

// 新闻标题
@property (nonatomic, strong) NSString * title;

// 新闻描述
@property (nonatomic, strong) NSString * summary;


@property (nonatomic, strong) NSString * url;

@property (nonatomic, strong) NSString * content;


@end

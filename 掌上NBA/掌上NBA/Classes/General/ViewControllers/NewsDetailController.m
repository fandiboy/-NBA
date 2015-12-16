//
//  NewsDetailController.m
//  掌上NBA
//
//  Created by fandi on 15/11/18.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "NewsDetailController.h"
#import "NewsModels.h"

@interface NewsDetailController ()<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *view4Web;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@property (nonatomic, strong) NewsModels *models;

@property (nonatomic, strong) UIWebView *webView;
@end

@implementation NewsDetailController





- (void)viewDidLoad {
    [super viewDidLoad];
//    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.newsDetailDM dataParseWithUrl:self.url];
    NSURL *url = [NSURL URLWithString:self.url];

    // 2.创建请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 3.建立会话
    NSURLSession *sesson = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [sesson dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSDictionary *dict1 = dic[@"result"];
            NSDictionary *dict2 = dict1[@"share"];
            //                self.models = [NewsDetailModel new];
            //                [_models setValuesForKeysWithDictionary:dict2];
            //                [_dataArray addObject:_models];
            NSString *urlString = dict2[@"url"];
            NSLog(@"dic2 = %@", urlString);
            
            NSURLRequest *requstUrl = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.view4Web.delegate = self;
                [self.view4Web loadRequest:requstUrl];
            });
        }
        
        
       
        
    }];
    // 使用resume方法启动任务
    [task resume];

}

// webView开始加载时
- (void) webViewDidStartLoad:(UIWebView *)webView
{
    //创建UIActivityIndicatorView背底半透明View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [view setTag:108];
    [view setBackgroundColor:[UIColor blackColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    _activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    [_activityIndicator setCenter:view.center];
    [_activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [view addSubview:_activityIndicator];
    
    [_activityIndicator startAnimating];
}

// webView加载完毕
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    
    
    // 去广告 通过OC与JS交互：stringByEvaluatingJavaScriptFromString
    [self.view4Web stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('downloadTips')[0].remove()"];
    [self.view4Web stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('downloadTips')[1].remove()"];
    
    
    [_activityIndicator stopAnimating];
    UIView *view = (UIView*)[self.view viewWithTag:108];
    [view removeFromSuperview];
    NSLog(@"webViewDidFinishLoad");
    
    
    
    
}


@end

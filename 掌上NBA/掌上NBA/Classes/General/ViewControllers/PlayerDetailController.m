//
//  PlayerDetailController.m
//  掌上NBA
//
//  Created by fandi on 15/11/20.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "PlayerDetailController.h"
#import "groups.h"

@interface PlayerDetailController ()

@property (nonatomic, strong) groups *group;
@property (strong, nonatomic) IBOutlet UIWebView *view4Web;

@end

@implementation PlayerDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlString = [NSString stringWithFormat:@"%@",self.url];
    NSLog(@"%@",urlString);
    NSURLRequest *requstUrl = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    [self.view4Web loadRequest:requstUrl];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

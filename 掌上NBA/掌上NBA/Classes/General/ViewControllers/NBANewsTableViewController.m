//
//  NBANewsTableViewController.m
//  掌上NBA
//
//  Created by fandi on 15/11/16.
//  Copyright © 2015年 fandi. All rights reserved.
//

#import "NBANewsTableViewController.h"
#import "NBANewsTableViewCell.h"
#import "DataManager.h"
#import "NewsModels.h"
#import "NewsDetailController.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"


@interface NBANewsTableViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) DataManager *dataManager;

@property (nonatomic, strong) NewsModels *newsModels;

@property (nonatomic,retain) UIScrollView * scroll;

@property (strong, nonatomic) IBOutlet UIView *view4Photo;

@property (nonatomic,retain) UIScrollView * scrollView;

@property (nonatomic,retain) UIButton * btn;

@property (nonatomic,retain) UIImageView * imgView;

@property (nonatomic,retain) UIPageControl * page;

@property (nonatomic,retain) NSTimer * timer;

@property (nonatomic,retain) UILabel *titleLabel;


@end


static int index1 = 0;
static NSInteger index2 = 0;

@implementation NBANewsTableViewController


- (NewsModels *)newsModels{
    if (!_newsModels) {
        _newsModels = [NewsModels new];
    }
    return _newsModels;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NBANewsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    self.dataManager = [DataManager new];
    [self.dataManager dataParse];
    __block typeof (self) temp = self;
    self.dataManager.myBlock = ^{
        [temp.tableView reloadData];
    };
    
    
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3);
    
    // 添加头部刷新
    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    // 添加尾部刷新
    // [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
    // 自动进入刷新状态
    [self.tableView headerBeginRefreshing];
    // [self.tableView footerBeginRefreshing];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3)];
    
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 5, [UIScreen mainScreen].bounds.size.height / 3);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = YES;
    _scrollView.backgroundColor = [UIColor whiteColor];
    
    _scrollView.delegate = self;

    [_view4Photo addSubview:_scrollView];
    
    
    
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, [UIScreen mainScreen].bounds.size.height / 3 - 40, 100, 20)];
    _page.numberOfPages = 5;
    _page.currentPage = 0;
    _page.pageIndicatorTintColor = [UIColor grayColor];
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    [_page addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    [_view4Photo addSubview:_page];
    
    [self creatTimer];
    
}

- (void)headerRereshing
{
    
    [self.dataManager dataParse];
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
}

-(void) creatTimer{
    //repeats 是否始终定时
    NSTimer *timer=[NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(nextImge) userInfo:nil repeats:YES];
    //当页面正在操作其他控件，继续执行当前轮换.将 NSDefaultRunLoopMode 改为 NSRunLoopCommonModes
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

//切换下一张图
-(void)nextImge{
    //当前第几张
    index2 =self.page.currentPage;
    if (index2==self.page.numberOfPages-1) {
        index2=0;
    }
    else
    {
        index2++;
    }
    //同时设置page
    self.page.currentPage=index2;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset=CGPointMake(index2*self.scrollView.frame.size.width, 0);
    }];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 更新滑块
    self.page.currentPage = _scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    index2 = self.page.currentPage;
    UIScrollView *tempScrollView = (UIScrollView *)[self.view viewWithTag:1001 + index2];
    tempScrollView.zoomScale = 1;
    [self creatTimer];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    // NSLog(@"%ld",_dataManager.dataArray.count);
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NBANewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NewsModels *newsModels = [NewsModels new];
    newsModels = _dataManager.dataArray[indexPath.section+5];
    cell.newsModels = newsModels;
    
    for (index1 = 0; index1 < 5; index1++) {
        self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0 + [UIScreen mainScreen].bounds.size.width*index1, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3)];
        [_scrollView addSubview:_scroll];
        
        
        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3);
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scroll addSubview:_btn];
        
        
        // UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"test%d.jpg",i]];
        self.imgView = [[UIImageView alloc] init];
        _imgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 3);
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:_dataManager.imgArray[index1]] placeholderImage:[UIImage imageNamed:@"test.jpg"]];
        [_btn addSubview:_imgView];
        
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _imgView.frame.size.height - 20, 300, 20)];
        _titleLabel.text = _dataManager.titleArray[index1];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [_imgView addSubview:_titleLabel];
        
    }
    
    
    
    
    return cell;
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsDetailController *newsDetail = [[NewsDetailController alloc] init];
    
    NewsModels *newsModels = [NewsModels new];
    newsModels = _dataManager.dataArray[indexPath.section + 5];
    // NSLog(@"id = %@",newsModels.nid);
    NSURL *url = [NSURL URLWithString:@"http://games.mobileapi.hupu.com/3/7.0.4/nba/getNewsDetail?client=b568f30a6dc9a8ab6aee414902d8d858f9d38dc4&night=0&nid="];
    NSString *str = [NSString stringWithFormat:@"%@",url];
    NSString *ssss = @"%";
    NSLog(@"%ld",newsModels.nid);
    NSString *str2 = [NSString stringWithFormat:@"%@%ld&token=MjM5OTIyNQ==%@7CMTQ0NzY4MjkxNQ==%@7Ca1d609ffc67b23e8bec59e7afd9f464c",str,newsModels.nid,ssss,ssss];
    url = [NSURL URLWithString:str2];
    
//    self.newsDDM.url = str2;
    newsDetail.url = str2;
    NSLog(@"-str2=%@------self.newsDDM.url=%@", str2, newsDetail.url);
    
    
    [self.navigationController pushViewController:newsDetail animated:YES];
}

- (void)btnClick:(UIButton *)sender{
    
    NewsDetailController *newsDetail = [[NewsDetailController alloc] init];
    
    NewsModels *newsModels = [NewsModels new];
    newsModels = _dataManager.dataArray[index2];
    // NSLog(@"id = %@",newsModels.nid);
    NSURL *url = [NSURL URLWithString:@"http://games.mobileapi.hupu.com/3/7.0.4/nba/getNewsDetail?client=b568f30a6dc9a8ab6aee414902d8d858f9d38dc4&night=0&nid="];
    NSString *str = [NSString stringWithFormat:@"%@",url];
    NSString *ssss = @"%";
    NSString *str2 = [NSString stringWithFormat:@"%@%ld&token=MjM5OTIyNQ==%@7CMTQ0NzY4MjkxNQ==%@7Ca1d609ffc67b23e8bec59e7afd9f464c",str,newsModels.nid,ssss,ssss];
    url = [NSURL URLWithString:str2];
    
    //    self.newsDDM.url = str2;
    newsDetail.url = str2;
    NSLog(@"-str2=%@------self.newsDDM.url=%@", str2, newsDetail.url);
    
    
    [self.navigationController pushViewController:newsDetail animated:YES];
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

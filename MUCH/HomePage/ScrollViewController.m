//
//  ScrollViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-28.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "ScrollViewController.h"
#import "AppDelegate.h"
#import "HomePageViewController.h"
@interface ScrollViewController ()

@end

@implementation ScrollViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //[scrollView setBackgroundColor:[UIColor redColor]];
    for (int i=0; i<3; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(320*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%d.png",i+1]]];
        [view addSubview:image];
        
        
        if(i==2){
            UIButton *gotoApp = [UIButton buttonWithType:UIButtonTypeCustom];
            [gotoApp setFrame:CGRectMake(105.5, 475, 109, 36)];
            [gotoApp setBackgroundImage:[UIImage imageNamed:@"引导页_03"] forState:UIControlStateNormal];
            [gotoApp addTarget:self action:@selector(gotoAppClick) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:gotoApp];
        }
        [scrollView addSubview:view];
    }
    [scrollView setShowsVerticalScrollIndicator:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    scrollView.contentSize=CGSizeMake(320*3, self.view.frame.size.height);
    scrollView.pagingEnabled=YES;
    scrollView.delegate=self;
    [self.view addSubview:scrollView];
    
    pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(145, 530, 30, 30)];
    [pageControl setCurrentPage:0];
    pageControl.pageIndicatorTintColor= [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.5];
    pageControl.currentPageIndicatorTintColor=[UIColor whiteColor];
    pageControl.numberOfPages = 3;//指定页面个数
    [pageControl setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    int page = scrollView.contentOffset.x / 320;//通过滚动的偏移量来判断目前页面所对应的小白点
    pageControl.currentPage = page;//pagecontroll响应值的变化
}

-(void)gotoAppClick{
    
    [UIView animateWithDuration:0.5 animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        HomePageViewController *homepage = [[HomePageViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homepage];
        [[AppDelegate instance] window].rootViewController = nav;
        [[[AppDelegate instance] window] makeKeyAndVisible];
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

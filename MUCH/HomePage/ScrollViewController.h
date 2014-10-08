//
//  ScrollViewController.h
//  MUCH
//
//  Created by 汪洋 on 14-8-28.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController<UIScrollViewDelegate>{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}

@end

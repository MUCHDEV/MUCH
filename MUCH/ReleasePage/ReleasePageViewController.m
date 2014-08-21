//
//  ReleasePageViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-11.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "ReleasePageViewController.h"
#import "GTMBase64.h"
#import "ReleaseEvent.h"
#import "ConnectionAvailable.h"
#import "MBProgressHUD.h"
@interface ReleasePageViewController ()

@end

@implementation ReleasePageViewController
@synthesize image;
@synthesize delegate;
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
    [self.view setBackgroundColor:RGBCOLOR(217, 217, 217)];
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 12.5, 21.5)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"06_03.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton setTitle:@"发布" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 70, 616/2, 478/2)];
    [imageView setImage:[UIImage imageNamed:@"04-1_03.png"]];
    
    //图片裁剪
    UIImage *srcimg = image;
    UIImageView *smallImageView = [[UIImageView alloc] init];
    smallImageView.frame = CGRectMake(4, 2, 601/2, 461/2);
    CGRect rect =  CGRectMake(19.5, 89.5, 601, 461);//要裁剪的图片区域，按照原图的像素大小来，超过原图大小的边自动适配
    CGImageRef cgimg = CGImageCreateWithImageInRect([srcimg CGImage], rect);
    smallImageView.image = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);//用完一定要释放，否则内存泄露
    [imageView addSubview:smallImageView];
    [self.view addSubview:imageView];
    
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(5,imageView.frame.size.height+imageView.frame.origin.y+5,278/2,62/2)];
    UIImageView *textImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,278/2,62/2)];
    [textImgView setImage:[UIImage imageNamed:@"_03.png"]];
    [textView addSubview:textImgView];
    _priceTextField = [[UITextField alloc] initWithFrame:CGRectMake(10,0,278/2-10,62/2)];
    _priceTextField.delegate = self;
    _priceTextField.textAlignment=NSTextAlignmentLeft;
    _priceTextField.placeholder=@"请标记价格";
    _priceTextField.returnKeyType=UIReturnKeyDone;
    _priceTextField.keyboardType = UIKeyboardTypeDecimalPad;
    _priceTextField.font =  [UIFont systemFontOfSize:15];
    [_priceTextField setClearButtonMode:UITextFieldViewModeWhileEditing];
    [textView addSubview:_priceTextField];
    [self.view addSubview:textView];
    [_priceTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [_priceTextField becomeFirstResponder];
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
-(void)leftBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtnClick{
    if (![ConnectionAvailable isConnectionAvailable]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接！";
        hud.labelFont = [UIFont fontWithName:nil size:14];
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:1];
    }else{
        NSData *photo = UIImageJPEGRepresentation(image, 0.8);
        NSString* encoded = [[NSString alloc] initWithData:[GTMBase64 encodeData:photo] encoding:NSUTF8StringEncoding];
        [ReleaseEvent ReleaseWithBlock:^(NSMutableArray *posts, NSError *error) {
            if(!error){
                //NSLog(@"posts ==> %@",posts);
                if([[NSString stringWithFormat:@"%@",[posts objectAtIndex:0]] isEqualToString:@"200"]){
                    /*if([delegate respondsToSelector:@selector(reloadList)]){
                     [delegate reloadList];
                     }*/
                }
                [self.navigationController popViewControllerAnimated:YES];
            }
        }price:_priceTextField.text imgStr:encoded];
    }
}
@end

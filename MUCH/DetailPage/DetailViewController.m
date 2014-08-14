//
//  DetailViewController.m
//  MUCH
//
//  Created by 汪洋 on 14-8-12.
//  Copyright (c) 2014年 lanjr. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailHeadTableViewCell.h"
#import "DetailContactTableViewCell.h"
#import "DetailContentTableViewCell.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    //LeftButton设置属性
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 12.5, 21.5)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"06_03.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    //RightButton设置属性
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(0, 0, 22, 39/2)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"04_03"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    //NavigationItem设置属性
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [titleview setImage:[UIImage imageNamed:@"03-2_033.png"]];
    self.navigationItem.titleView = titleview;
    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"lululululu",@"name",@"http://www.faceplusplus.com.cn/wp-content/themes/faceplusplus/assets/img/demo/1.jpg",@"url",@"不高兴，买包包asdfsadfasdfsadfasdfasdfasdfas",@"content",@"1",@"type",nil];
    
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"lululululu",@"name",@"http://www.faceplusplus.com.cn/wp-content/themes/faceplusplus/assets/img/demo/1.jpg",@"url",@"不高兴，买包包asdfsadfasdfsadfasdfasdfasdfas",@"content",@"0",@"type",nil];
    
    NSArray *array = [[NSArray alloc] initWithObjects:dic,dic1, nil];
    _allMessages = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        Message *message = [[Message alloc] init];
        message.dict = dict;
        message.name = [dict objectForKey:@"name"];
        message.content = [dict objectForKey:@"content"];
        message.iconURL = [NSURL URLWithString:[dict objectForKey:@"url"]];
        if([[dict objectForKey:@"type"] isEqualToString:@"1"]){
            message.type = MessageTypeOther;
        }else{
            message.type = MessageTypeMe;
        }
        [_allMessages addObject:message];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, 320, self.view.frame.size.height-44)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = NO;
    [_tableView setBackgroundColor:RGBCOLOR(217, 217, 217)];
    [self.view addSubview:_tableView];
    
    toolview = [[ToolView alloc] initWithFrame:CGRectMake(0, 524, 320, 44) superView:self.view];
    toolview.delegate = self;
    [self.view addSubview:toolview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"rightBtnClick");
}

#pragma mark 给数据源增加内容
- (void)addMessageWithContent:(NSString *)content{
    Message *msg = [[Message alloc] init];
    msg.content = content;
    msg.iconURL = [NSURL URLWithString:@"http://www.faceplusplus.com.cn/wp-content/themes/faceplusplus/assets/img/demo/1.jpg"];
    msg.name = @"wywyw";
    msg.type = MessageTypeMe;
    [_allMessages insertObject:msg atIndex:0];
    [_tableView reloadData];
    // 3、滚动至当前行
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_allMessages.count - 1 inSection:0];
    //[_tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0){
        NSString *stringcell = @"DetailHeadTableViewCell";
        DetailHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        UIImage* image=[UIImage imageNamed:@"nature.jpg"];
        if(!cell){
            cell = [[DetailHeadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell img:image] ;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == 1){
        NSString *stringcell = @"DetailContactTableViewCell";
        DetailContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[DetailContactTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell] ;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *stringcell = @"DetailContentTableViewCell%d";
        DetailContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:stringcell];
        if(!cell){
            cell = [[DetailContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stringcell indexRow:indexPath.row arrCount:[_allMessages count]] ;
        }else{
            [cell setNewBgView:indexPath.row-1 newArrCount:[_allMessages count]];
        }
        cell.messageModel = _allMessages[indexPath.row-2];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_allMessages count]+2;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 249;
    }else if(indexPath.row == 1){
        return 60;
    }else if (indexPath.row == 2){
        return 109/2;
    }
    return 98/2;
}
@end

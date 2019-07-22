//
//  ViewController.m
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "ViewController.h"
#import "LiveMessageCell.h"
#import "MessageModel.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataSources;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController
-(NSMutableArray*)dataSources{
    if (!_dataSources) {
        _dataSources = [NSMutableArray array];
    }
    return _dataSources;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    tableView.separatorColor = [UIColor clearColor];
    [tableView registerClass:[LiveMessageCell class] forCellReuseIdentifier:NSStringFromClass([LiveMessageCell class])];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view.mas_trailing).with.offset(-80);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20);
        make.height.mas_equalTo(138);
    }];
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTime) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:time forMode:NSRunLoopCommonModes];

}

-(void)startTime{
    int x = arc4random() % 100;
    NSString *str = @"测试测试张奥能放大愤怒地发的看法你短发你短发拿到奖愤怒的开发你的愤怒的愤怒的减肥你的减肥愤怒地分南大街";
    NSArray *images = @[[UIImage imageNamed:@"level_27"],[UIImage imageNamed:@"level_28"]];
    MessageModel *model = [MessageModel new];
    if (x % 2 == 0) {
        str = @"嘻嘻 来啦 欢迎~";
        images = @[[UIImage imageNamed:@"level_33"]];
    }
    model.text = str;
    model.images = images;
    CGSize size = [LiveMessageCell caculateCellSizeModel:model];
    model.cellWidth = size.width;
    model.cellHeight = size.height;
    [self.dataSources addObject:model];
    [self.tableView reloadData];
    if (self.dataSources.count > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.dataSources.count-1 inSection:0];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.005 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:NO];
            [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        });
    }
}

# pragma mark -- UITabelViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSources.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LiveMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LiveMessageCell class]) forIndexPath:indexPath];
    MessageModel *model = self.dataSources[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageModel *model = self.dataSources[indexPath.row];
    return model.cellHeight+3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

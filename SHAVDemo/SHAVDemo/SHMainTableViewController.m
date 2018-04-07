//
//  SHMainTableViewController.m
//  SHAVDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "SHMainTableViewController.h"
//录音界面
#import "SHRecordAudioVC.h"
//播放短音频
#import "SHShortAudioVC.h"
//播放本地歌曲
#import "SHPlayLocalMusicVC.h"
//可以播放本地音乐、本地视频、网络音乐、网络视频
#import "SHAVPlayerVC.h"
@interface SHMainTableViewController ()
@property(nonatomic,copy)NSMutableArray *allItems;
@end

@implementation SHMainTableViewController
static NSString *cellIdentifier = @"cellIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    self.tableView.rowHeight = 60;
    
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = self.allItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            //录音界面
           [self.navigationController pushViewController:[[SHRecordAudioVC alloc]init] animated:YES ];
            break;
        case 1:
            //短音频界面
            [self.navigationController pushViewController:[[SHShortAudioVC alloc]init] animated:YES ];
            break;
        case 2:
            //本地音乐界面
            [self.navigationController pushViewController:[[SHPlayLocalMusicVC alloc]init] animated:YES ];
            break;
        case 3:
            //本地和网络音乐和视频
            [self.navigationController pushViewController:[[SHAVPlayerVC alloc]init] animated:YES ];
            break;
            
        default:
            break;
    }
}

- (NSMutableArray *)allItems
{
    if (_allItems == nil) {
        _allItems = [NSMutableArray array];
        [_allItems addObject:@"录音"];
        [_allItems addObject:@"短音频"];
        [_allItems addObject:@"本地音频"];
        [_allItems addObject:@"本地网络音视频"];
    }
    return _allItems;
}

@end

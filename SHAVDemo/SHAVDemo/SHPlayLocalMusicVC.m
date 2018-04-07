//
//  SHPlayLocalMusicVC.m
//  SHAVDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//  播放本地歌曲

#import "SHPlayLocalMusicVC.h"
#import <AVFoundation/AVFoundation.h>
@interface SHPlayLocalMusicVC ()
//@property (nonatomic,copy)NSMutableDictionary *allPlayersDic;

/** 播放器 */
@property (nonatomic, strong) AVAudioPlayer *player;
@end

@implementation SHPlayLocalMusicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)startMusic:(id)sender {
    
    [self.player play];
//    [self playMusicWithFileName:@"music_a.mp3"];
}
- (IBAction)suspendMusic:(id)sender {
    [self.player pause];
//    [self pauseMusicWithFileName:@"music_a.mp3"];
}
- (IBAction)stopMusic:(id)sender {
    [self.player stop];
    self.player  = nil;
//    [self stopMusicWithFileName:@"music_a.mp3"];
}


#pragma mark - 懒加载
- (AVAudioPlayer *)player
{
    if (_player == nil) {
        
        // 1.创建音乐文件
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"music_a.mp3" withExtension:nil];
        
        // 2.创建播放器
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        
        // 3.准备播放
        [_player prepareToPlay];
    }
    return _player;
}









//- (NSMutableDictionary *)allPlayersDic
//{
//    if (_allPlayersDic == nil) {
//        _allPlayersDic = [NSMutableDictionary dictionary];
//    }
//    return _allPlayersDic;
//}

//- (void)playMusicWithFileName:(NSString *)fileName
//{
//    // 1.创建空的播放器
//    AVAudioPlayer *player = nil;
//
//    // 2.从字典中取出播放器
//    player = self.allPlayersDic[fileName];
//
//    // 3.判断播放器是否为空
//    if (player == nil) {
//        // 4.生成对应音乐资源
//        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
//        if (fileUrl == nil) return;
//
//        // 5.创建对应的播放器
//        player = [[AVAudioPlayer alloc] initWithContentsOfURL:fileUrl error:nil];
//
//        // 6.保存到字典中
//        [self.allPlayersDic setObject:player forKey:fileName];
//
//        // 7.准备播放
//        [player prepareToPlay];
//    }
//
//    // 8.开始播放
//    [player play];
//
//}
////暂停
//- (void)pauseMusicWithFileName:(NSString *)fileName
//{
//    // 1.从字典中取出播放器
//    AVAudioPlayer *player = self.allPlayersDic[fileName];
//
//    // 2.暂停音乐
//    if (player) {
//        [player pause];
//    }
//}
////停止
//- (void)stopMusicWithFileName:(NSString *)fileName
//{
//    // 1.从字典中取出播放器
//    AVAudioPlayer *player = self.allPlayersDic[fileName];
//
//    // 2.停止音乐
//    if (player) {
//        [player stop];
//        [self.allPlayersDic removeObjectForKey:fileName];
//        player = nil;
//    }
//}



@end

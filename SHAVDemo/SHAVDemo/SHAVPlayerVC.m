//
//  SHAVPlayerVC.m
//  SHAVDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "SHAVPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface SHAVPlayerVC ()
/** 播放器 */
@property (nonatomic, strong) AVPlayer *player;
@end

@implementation SHAVPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    //开始播放 方式一  里面两种效果
    [self.player play];
    
    //方式二
    [self mpMoviePlayerControllerTest];
    //方式三
    [self mpMoviePlayerViewControllerTest];
}

- (AVPlayer *)player
{
    if (_player == nil) {
        
        
        //方法一
        // 1.加载视频资源
        //本地
//        NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"music_a.mp3" withExtension:nil];
        
        NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"testVideo.mp4" withExtension:nil];
        //网络
        NSURL *networkUrl = [NSURL URLWithString:@""];
        
        // 2.创建播放器
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:localUrl];
        
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        // 3.创建AVPlayerLayer  音频不需要  视频需要
//        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
//        playerLayer.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
//        [self.view.layer addSublayer:playerLayer];
        
        
        //全屏播放  方法二
        AVPlayerViewController *avplayerVC = [[AVPlayerViewController alloc]init];
        avplayerVC.player = _player;
        
        [self presentViewController:avplayerVC animated:YES completion:nil];
        
    }
    return _player;
}

- (void)mpMoviePlayerControllerTest
{
        NSURL *url = [NSURL URLWithString:@"http://v4ttyey-10001453.video.myqcloud.com/Microblog/288-4-1452304375video1466172731.mp4"];
    
//    NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"testVideo.mp4" withExtension:nil];
    MPMoviePlayerController *mpMoviePlayerVC = [[MPMoviePlayerController alloc]initWithContentURL:url];
    mpMoviePlayerVC.view.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
    [self.view addSubview:mpMoviePlayerVC.view];
    
}
- (void)mpMoviePlayerViewControllerTest
{
        NSURL *url = [NSURL URLWithString:@"http://v4ttyey-10001453.video.myqcloud.com/Microblog/288-4-1452304375video1466172731.mp4"];
    
//    NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"testVideo.mp4" withExtension:nil];
    MPMoviePlayerViewController *playerViewVC = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    [self presentViewController:playerViewVC animated:YES completion:nil];
}




@end

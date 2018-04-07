//
//  SHRecordAudioVC.m
//  SHAVDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//

#import "SHRecordAudioVC.h"
#import <AVFoundation/AVFoundation.h>
@interface SHRecordAudioVC ()

@property (nonatomic,strong)AVAudioRecorder *recorder;
@end

@implementation SHRecordAudioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//开始录音
- (IBAction)beginRecord:(id)sender {
    //在开始录音前先结束录音
    [self.recorder stop];
    [self.recorder record];
}
//结束录音
- (IBAction)endRecord:(id)sender {
    [self.recorder stop];
    
}

- (AVAudioRecorder *)recorder
{
    if (_recorder == nil) {
        // 1.创建沙盒路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        
        // 2.拼接音频文件
        NSString *filePath = [path stringByAppendingPathComponent:@"audio.caf"];
        NSLog(@"path:   %@",filePath);
        // 3.转化成url file://
        NSURL *url = [NSURL fileURLWithPath:filePath];
        
        // 4.设置录音的参数
        NSDictionary *settingRecorder = @{
                                          //音质
                                          AVEncoderAudioQualityKey : [NSNumber numberWithInteger:AVAudioQualityHigh],
                                          //比特采样率
                                          AVEncoderBitRateKey : [NSNumber numberWithInteger:16],
                                          //采样率
                                          AVSampleRateKey : [NSNumber numberWithFloat:8000],
                                          //通道数
                                          AVNumberOfChannelsKey : [NSNumber numberWithInteger:2]
                                          };
        
        
        // 5.创建录音对象
        _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settingRecorder error:nil];
    }
    return _recorder;
}

@end

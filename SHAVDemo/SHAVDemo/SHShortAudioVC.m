//
//  SHShortAudioVC.m
//  SHAVDemo
//
//  Created by 宋航 on 2018/4/7.
//  Copyright © 2018年 北京涛医宝. All rights reserved.
//  播放短音频

#import "SHShortAudioVC.h"
#import <AVFoundation/AVFoundation.h>
@interface SHShortAudioVC ()
@property (nonatomic,copy) NSMutableDictionary *allSoundIDsDic;
@end

@implementation SHShortAudioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (NSMutableDictionary *)allSoundIDsDic
{
    if (_allSoundIDsDic == nil) {
        _allSoundIDsDic = [NSMutableDictionary dictionary];
    }
    return _allSoundIDsDic;
}

- (IBAction)three:(id)sender {
    [self playSoundWithSoundName:@"3.wav"];
}
- (IBAction)four:(id)sender {
    [self playSoundWithSoundName:@"4.wav"];
}


#pragma mark - 播放音效
- (void)playSoundWithSoundName:(NSString *)soundName
{
    // 1.创建soundID = 0
    SystemSoundID soundID = 0;
    // 2.从字典中取出soundID
    soundID = [self.allSoundIDsDic[soundName] unsignedIntValue];;
    // 3.判断soundID是否为0
    if (soundID == 0) {
        // 3.1生成soundID
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        AudioServicesCreateSystemSoundID(url, &soundID);
        // 3.2将soundID保存到字典中
        [self.allSoundIDsDic setObject:@(soundID) forKey:soundName];
    }
    // 4.播放音效
    AudioServicesPlaySystemSound(soundID);
}




@end

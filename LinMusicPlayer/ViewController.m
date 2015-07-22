//
//  ViewController.m
//  LinMusicPlayer
//
//  Created by lin on 15/7/21.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "ViewController.h"

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.playBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    self.playBtn.center = CGPointMake(self.view.center.x, 500);
    self.playBtn.backgroundColor = RGBA(0x6b, 0xda, 0xdd, 0.5);
    self.playBtn.layer.cornerRadius = 8;
    [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
    self.playBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [self.playBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.playBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.playBtn addTarget:self action:@selector(playBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playBtn];

/*
    必须使用fileURLWithPath初始化才能正常播放，详见http://blog.csdn.net/jiajiayouba/article/details/44241751
*/
    NSURL *musicURL  = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Call your name" ofType:@"mp3"]];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.audioPlayer.delegate = self;
    self.audioPlayer.volume   = 1.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (void)playBtnClicked {
    if([self.playBtn.titleLabel.text isEqualToString:@"播放"]) {
        [self.playBtn setTitle:@"停止" forState:UIControlStateNormal];
        [self.audioPlayer play];
    }else {
        [self.playBtn setTitle:@"播放" forState:UIControlStateNormal];
        [self.audioPlayer stop];
    }
}

@end

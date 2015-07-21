//
//  ViewController.m
//  LinMusicPlayer
//
//  Created by lin on 15/7/21.
//  Copyright (c) 2015年 lin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.playBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 80)];
    self.playBtn.center = CGPointMake(self.view.center.x, 400);
    self.playBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.playBtn];

    NSURL *musicURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Call your name" ofType:@"mp3"]];    //必须使用fileURLWithPath初始化才能正常播放，详见http://blog.csdn.net/jiajiayouba/article/details/44241751
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicURL error:nil];
    self.audioPlayer.delegate = self;
    self.audioPlayer.volume = 1.0;
    [self.audioPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

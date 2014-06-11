//
//  ViewController.h
//  kenken-pa
//
//  Created by 羽野 真悟 on 13/05/10.
//  Copyright (c) 2013年 羽野 真悟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *image1;
    IBOutlet UIImageView *image2;
    IBOutlet UIImageView *image3;
    IBOutlet UIImageView *addImage;
    IBOutlet UIImageView *resultImage;
    
    IBOutlet UIButton *startButton;
    IBOutlet UIButton *topButton;
    IBOutlet UILabel *pointLabel;
    
    IBOutlet UILabel *clearScoreLabel;
    IBOutlet UILabel *restCountLabel;    
    
    UIImageView *customer1;
    NSInteger imageCount;
    NSInteger score;
    NSInteger touchFlag;
    NSInteger gameFlag;
    NSInteger kenpaFlag;
    NSInteger kenpaFlag2;
    NSInteger scoreFlag;
    NSInteger maxCount;
    NSInteger clearScore;
    double speed;
    NSTimer *timer;                     //経過時間呼び出し用
    NSDate *stDate;                     //ゲーム開始時刻格納
    NSDate *nowDate;                    //現在時刻格納
}

@property(nonatomic,retain) UIImageView *image1;
@property(nonatomic,retain) UIImageView *image2;
@property(nonatomic,retain) UIImageView *image3;
@property(nonatomic,retain) UILabel *pointLabel;
@property(nonatomic,retain) UILabel *resultLabel;
@property(nonatomic,retain) UILabel *clearScoreLabel;
@property(nonatomic,retain) UIImageView *addImage;
@property(nonatomic,retain) UIImageView *resultImage;

@property(nonatomic,retain) IBOutlet UIButton *button1;
@property(nonatomic,retain) IBOutlet UIButton *button2;

-(void)setSpped:(double)value;
-(void)setLevel:(int)value;
-(IBAction)startButton:(id)sender;
-(IBAction)topButton:(id)sender;

@end

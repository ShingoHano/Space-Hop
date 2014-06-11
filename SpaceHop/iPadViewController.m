//
//  iPadViewController.m
//  kenken-pa
//
//  Created by 羽野 真悟 on 13/06/04.
//  Copyright (c) 2013年 羽野 真悟. All rights reserved.
//

#import "iPadViewController.h"

@interface iPadViewController ()

@end

@implementation iPadViewController
@synthesize image1,image2,image3,pointLabel,resultLabel,clearScoreLabel;
@synthesize button1,button2,addImage,resultImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    touchFlag=0;
    gameFlag=0;
    kenpaFlag=0;
    score=0;
    imageCount=0;
    
    image1.hidden=false;
    image2.hidden=false;
    image3.hidden=false;
    resultLabel.hidden=true;
    addImage.hidden=true;
    resultImage.hidden=true;
    
    pointLabel.text=@"0";
    clearScoreLabel.text=@"0";
    restCountLabel.text=NSLocalizedString(@"0回",nil);
    self.view.multipleTouchEnabled = YES;
    
    resultLabel.backgroundColor=[UIColor clearColor];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bacl_wall_iPad.png"]];
    
    [button1 setTitle:NSLocalizedString(@"メニュー", nil) forState:UIControlStateNormal];
    [button2 setTitle:NSLocalizedString(@"スタート", nil) forState:UIControlStateNormal];
}




-(IBAction)topButton:(id)sender
{
    [self.view removeFromSuperview];
}

-(IBAction)startButton:(id)sender
{
    clearScoreLabel.text=[NSString stringWithFormat:@"%d",clearScore];
    
    if(gameFlag==0)
    {
        stDate = [[NSDate alloc] init];     //ゲーム開始時刻
        nowDate = [[NSDate alloc] init];    //現在時刻
        
        //1秒間隔で時間を取得
        timer = [NSTimer scheduledTimerWithTimeInterval:(speed)
                                                 target:self
                                               selector:@selector(onTimer:)
                                               userInfo:nil
                                                repeats:YES];
        
        gameFlag=1;
    }
}

/*
 - (void)saveData
 {
 NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
 if(maxCount==30)
 {
 [ud setInteger:1 forKey:@"STAGE_2"];
 }
 else if(maxCount==40)
 {
 [ud setInteger:1 forKey:@"STAGE_3"];
 }
 else
 {
 [ud setInteger:1 forKey:@"STAGE_4"];
 }
 
 [ud synchronize];
 }*/


-(void)setSpped:(double)value
{
    speed=1-0.015*value;
}

-(void)setLevel:(int)value
{
    maxCount=20+value*2;
    clearScore=maxCount*10*(0.6+value/50);
}

// 画面に指を一本以上タッチしたときに実行されるメソッド
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIImage *img1=[UIImage imageNamed:@"character2"];
    UIImage *img2=[UIImage imageNamed:@"character3"];
    
    if([touches count]==1)
    {
        touchFlag=1;
        customer1.image=img2;
    }
    else if([touches count]==2|| [touches count]==3)
    {
        touchFlag=0;
        customer1.image=img1;
    }
}

-(void)onTimer:(NSTimer*)timerParameter {
    
    nowDate=[NSDate date];                                      //現在時刻を取得
    [self changeImage];
}

- (void)changeImage
{
    imageCount++;
    
    if(imageCount>=maxCount)
    {
        addImage.hidden=true;
        restCountLabel.text=[NSString stringWithFormat:NSLocalizedString(@"%d回",nil),0];
        
        if(score>=clearScore)
        {
            resultImage.image=[UIImage imageNamed:@"level_clear_logo2.png"];
        }
        else
        {
            resultImage.image=[UIImage imageNamed:@"game_over_logo2.png"];
        }
        resultImage.hidden=false;
        image2.hidden=true;
        return;
    }
    restCountLabel.text=[NSString stringWithFormat:NSLocalizedString(@"%d回",nil),maxCount-imageCount];
    
    int random=rand()%5;
    UIImage *img1;
    UIImage *img2;
    image1.backgroundColor=[UIColor clearColor];
    image2.backgroundColor=[UIColor clearColor];
    
    if(random==0)
    {
        img1=[UIImage imageNamed:@"ken3_1"];
        img2=[UIImage imageNamed:@"pa3_1"];
    }
    else if(random==1)
    {
        img1=[UIImage imageNamed:@"ken4_1"];
        img2=[UIImage imageNamed:@"pa4_1"];
    }
    else if(random==2)
    {
        img1=[UIImage imageNamed:@"ken5_1"];
        img2=[UIImage imageNamed:@"pa5_1"];
    }
    else if(random==3)
    {
        img1=[UIImage imageNamed:@"ken6_1"];
        img2=[UIImage imageNamed:@"pa6_1"];
    }
    else if(random==4)
    {
        img1=[UIImage imageNamed:@"ken7_1"];
        img2=[UIImage imageNamed:@"pa7_1"];
    }
    
    image3.hidden=true;
    
    if(!customer1)
    {
        customer1= [[UIImageView alloc] initWithImage:image3.image];
        [customer1 setFrame:image3.frame];
        customer1.alpha=0.95;
        [self.view addSubview:customer1];
    }
    
    [UIView animateWithDuration:speed/2
                     animations:^{customer1.frame =CGRectOffset(customer1.frame, 0, -40);}
                     completion:^(BOOL finished) {
                         
                         srand(time(nil));
                         if(gameFlag==1)
                         {
                             kenpaFlag2=kenpaFlag;
                             image1.image=image2.image;
                         }
                         else
                         {
                             image1.image=nil;
                         }
                         
                         int ram=rand()%2;
                         
                         if(ram!=1)
                         {
                             kenpaFlag=1;
                             image2.image=img1;
                         }
                         else
                         {
                             kenpaFlag=0;
                             image2.image=img2;
                         }
                         
                         
                         
                         [UIView animateWithDuration:speed/2
                                          animations:^{customer1.frame =CGRectOffset(customer1.frame, 0, 40);}
                                          completion:^(BOOL finished) {
                                              if(kenpaFlag2==1)
                                              {
                                                  if(touchFlag==1)
                                                  {
                                                      addImage.hidden=false;
                                                      score+=10;
                                                      pointLabel.text=[NSString stringWithFormat:@"%d",score];
                                                  }
                                              }
                                              else
                                              {
                                                  if(touchFlag==0)
                                                  {
                                                      addImage.hidden=false;
                                                      score+=10;
                                                      pointLabel.text=[NSString stringWithFormat:@"%d",score];
                                                  }
                                              }
                                          }];  }];
    addImage.hidden=true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

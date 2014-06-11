//
//  iPadMenuViewController.m
//  kenken-pa
//
//  Created by 羽野 真悟 on 13/06/04.
//  Copyright (c) 2013年 羽野 真悟. All rights reserved.
//

#import "iPadMenuViewController.h"
#import "iPadViewController.h"
#import "KGModal.h"

@interface iPadMenuViewController ()

@end

@implementation iPadMenuViewController
@synthesize sleder,sleder2;
@synthesize label1,label2,label3,label4,button1;


iPadViewController *viewController;
//StageViewController *stageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bacl_wall_iPad.png"]];
    // Do any additional setup after loading the view from its nib.
    
    slider.minimumValue = 0.0;  // 最小値を0に設定
    slider.maximumValue = 50.0;  // 最大値を500に設定
    slider.value = 25.0;  // 初期値を250に設定
    slider2.minimumValue = 0.0;  // 最小値を0に設定
    slider2.maximumValue = 10.0;  // 最大値を500に設定
    slider2.value = 5.0;  // 初期値を250に設定
    
    // 値が変更された時にhogeメソッドを呼び出す
    [slider addTarget:self action:@selector(changeSlider:) forControlEvents:UIControlEventValueChanged];
    
    
    // バナービューの作成
    // ADBannerView *adView;
    bannerIsVisible=NO;
    adView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    adView.autoresizesSubviews = YES;
    adView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
    adView.delegate = self;
    [self.view addSubview:adView];
    adView.alpha = 0.0;
    
    [self load];
    
    if(launchFlag==0)
    {
//        [self showAction:nil];
    }
    
    label1.text=NSLocalizedString(@"遅い", nil);
    label2.text=NSLocalizedString(@"速い", nil);
    label3.text=NSLocalizedString(@"易しい", nil);
    label4.text=NSLocalizedString(@"難しい", nil);
    [button1 setTitle:NSLocalizedString(@"スタート", nil) forState:UIControlStateNormal];

}

- (void)save
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"LaunchCount"];
    [defaults synchronize];
}

-(void)load
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    launchFlag=[defaults integerForKey:@"LaunchCount"];
    
    launchFlag=launchFlag?1:0;
}



- (void)showAction:(id)sender{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 380)];
    
    CGRect welcomeLabelRect = contentView.bounds;
    welcomeLabelRect.origin.y = 20;
    welcomeLabelRect.size.height = 20;
    UIFont *welcomeLabelFont = [UIFont boldSystemFontOfSize:14];
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:welcomeLabelRect];
    welcomeLabel.text = NSLocalizedString(@"このゲームの遊び方について",nil);
    welcomeLabel.font = welcomeLabelFont;
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.textAlignment = NSTextAlignmentCenter;
    welcomeLabel.backgroundColor = [UIColor clearColor];
    welcomeLabel.shadowColor = [UIColor blackColor];
    welcomeLabel.shadowOffset = CGSizeMake(0, 1);
    [contentView addSubview:welcomeLabel];
    
    CGRect infoLabelRect = CGRectInset(contentView.bounds, 5, 5);
    infoLabelRect.origin.y = CGRectGetMaxY(welcomeLabelRect)+5;
    infoLabelRect.size.height -= CGRectGetMinY(infoLabelRect);
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:infoLabelRect];
    infoLabel.text = NSLocalizedString(@"宇宙でケンケンパをするゲームです。\n\n惑星が1つの時はシングルタップで「ケン」、惑星が2つの時はマルチタップで「パ」をしてください。\n\nタップは片手でやると上手く反応するようです。",nil);
    infoLabel.numberOfLines = 20;
    infoLabel.textColor = [UIColor whiteColor];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.backgroundColor = [UIColor clearColor];
    infoLabel.shadowColor = [UIColor blackColor];
    infoLabel.shadowOffset = CGSizeMake(0, 1);
    [contentView addSubview:infoLabel];
    
    [[KGModal sharedInstance] showWithContentView:contentView andAnimated:YES];
    [self save];
}


// iAdの受信に成功したとき
-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    // バナーが表示されていない場合
    if ( !bannerIsVisible ) {
        // 表示
        banner.alpha = 1.0f;
    }
    // フラグをYESに
    bannerIsVisible = YES;
}

// iAdの受信に失敗したとき
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    // バナーが表示されている場合
    if ( bannerIsVisible ) {
        // 非表示
        banner.alpha = 0.0f;
    }
    // フラグをNOに
    bannerIsVisible = NO;
}

-(void)changeSlider:(UISlider*)slider{
    //    NSLog(@"%d",(int)slider.value);
}


-(IBAction)gameStart:(id)sender
{
    /*
     stageView=[[StageViewController alloc]initWithNibName:@"StageViewController" bundle:nil];
     [stageView setSpped:(int)slider.value];
     
     [self.view addSubview:stageView.view];*/
    
    
    viewController=[[iPadViewController alloc]initWithNibName:@"iPadViewController" bundle:nil];
    [viewController setLevel:(int)slider2.value];
    [viewController setSpped:(int)slider.value];
    [self.view addSubview:viewController.view];
    [viewController viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

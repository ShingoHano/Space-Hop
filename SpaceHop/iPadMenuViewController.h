//
//  iPadMenuViewController.h
//  kenken-pa
//
//  Created by 羽野 真悟 on 13/06/04.
//  Copyright (c) 2013年 羽野 真悟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface iPadMenuViewController : UIViewController<ADBannerViewDelegate>
{
    IBOutlet UISlider *slider;
    IBOutlet UISlider *slider2;
    
    ADBannerView *adView;
    BOOL bannerIsVisible;
    NSInteger launchFlag;
}


@property(nonatomic,retain) UISlider *sleder;
@property(nonatomic,retain) UISlider *sleder2;


-(IBAction)gameStart:(id)sender;

@property(nonatomic,retain) IBOutlet UILabel *label1;
@property(nonatomic,retain) IBOutlet UILabel *label2;
@property(nonatomic,retain) IBOutlet UILabel *label3;
@property(nonatomic,retain) IBOutlet UILabel *label4;
@property(nonatomic,retain) IBOutlet UIButton *button1;




@end

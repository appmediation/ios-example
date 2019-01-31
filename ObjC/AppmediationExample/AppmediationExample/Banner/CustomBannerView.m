//
//  CustomBannerView.m
//  AppmediationExample
//
//  Created by Mert Celik on 1/31/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import "CustomBannerView.h"
#import <Appmediation/AMBanner.h>

@interface CustomBannerView () <AMBannerDelegate>
@property (nonatomic,strong) UIView* customView;
@end

@implementation CustomBannerView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createCustomView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadBanner];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // It is always good idea to remove objects before leaving the screen,
    // and re-add them when you are back to screen. So the system can
    // release memory for them if needed.
    [self removeBanner];
}

- (void)createCustomView {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    _customView = [[UIView alloc] initWithFrame:CGRectMake(0, screenSize.height/2, screenSize.width, 100)];
    [_customView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_customView];
}

#pragma mark AMBanner Implementation

- (void)loadBanner {
    [AMBanner setDelegate:self];
    [_customView addSubview:[AMBanner sharedInstance]];
    [AMBanner sharedInstance].frame = CGRectMake(0, 0, 320, 50);
    [AMBanner loadAd];
}

- (void)removeBanner {
    [AMBanner removeBanner];
}

#pragma mark AMBanner Delegates (Optional)

- (void)AMBannerDidLoad:(AMBanner *)banner {
    NSLog(@"<AM>: Banner did load.");
}

- (void)AMBannerDidFailToLoad:(AMBanner *)banner withError:(NSError *)error {
    NSLog(@"<AM>: Banner did fail to load with error: %@",error.localizedDescription);
}

- (void)AMBannerDidShow:(AMBanner *)banner {
    NSLog(@"<AM>: Banner did show.");
}

- (void)AMBannerDidClick:(AMBanner *)banner {
    NSLog(@"<AM>: Banner did click.");
}

@end

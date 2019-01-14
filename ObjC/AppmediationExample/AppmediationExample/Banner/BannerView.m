//
//  BannerView.m
//  AppmediationExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import "BannerView.h"
#import <Appmediation/AMBanner.h>

@interface BannerView ()<AMBannerDelegate>

@end

@implementation BannerView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadBanner];
}

- (void)viewWillDisappear:(BOOL)animated {
    // It is always good idea to remove objects before leaving the screen,
    // and re-add them when you are back to screen. So the system can
    // release memory for them if needed.
    [self removeBanner];
}

#pragma mark AMBanner Implementation

- (void)loadBanner {
    [AMBanner setDelegate:self];
    [AMBanner showBannerSize:AMSize_320x50 position:Bottom rootViewController:self];
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

//
//  InterstitialView.m
//  AppmediationExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import "InterstitialView.h"
#import <Appmediation/AMInterstitial.h>

@interface InterstitialView ()<AMInterstitialDelegate>

@end

@implementation InterstitialView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadInterstitial];
}

#pragma mark AMInterstitial Implementation

- (void)loadInterstitial {
    [AMInterstitial setDelegate:self];
    [AMInterstitial loadAd];
}

- (void)showInterstitial {
    if ([AMInterstitial isReady]) {
        [AMInterstitial presentFromViewController:self];
    } else {
        NSLog(@"<AM>: Interstitial is not ready.");
    }
}

#pragma mark AMInterstitial Delegates (Optional)

- (void)AMInterstitialDidLoad:(AMInterstitial *)interstitial {
    NSLog(@"<AM>: Interstitial did load.");
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self showInterstitial];
}

- (void)AMInterstitialDidFailToLoad:(AMInterstitial *)interstitial withError:(NSError *)error {
    NSLog(@"<AM>: Interstitial did fail to load with error: %@",error.localizedDescription);
}

- (void)AMInterstitialDidShow:(AMInterstitial *)interstitial {
    NSLog(@"<AM>: Interstitial did show.");
}

- (void)AMInterstitialDidClick:(AMInterstitial *)interstitial {
    NSLog(@"<AM>: Interstitial did click.");
}

- (void)AMInterstitialDidClose:(AMInterstitial *)interstitial {
    NSLog(@"<AM>: Interstitial did close.");
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end

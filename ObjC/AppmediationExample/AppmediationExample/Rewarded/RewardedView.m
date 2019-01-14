//
//  RewardedView.m
//  AppmediationExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import "RewardedView.h"
#import <Appmediation/AMRewarded.h>

@interface RewardedView ()<AMRewardedDelegate>

@end

@implementation RewardedView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadRewarded];
}

#pragma mark AMRewarded Implementation

- (void)loadRewarded {
    [AMRewarded setDelegate:self];
    [AMRewarded loadAd];
}

- (void)showRewarded {
    if ([AMRewarded isReady]) {
        [AMRewarded presentFromViewController:self];
    } else {
        NSLog(@"<AM>: Rewarded is not ready.");
    }
}

#pragma mark AMRewarded Delegates (Optional)

- (void)AMRewardedDidLoad:(AMRewarded *)rewarded {
    NSLog(@"<AM>: Rewarded did load.");
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self showRewarded];
}

- (void)AMRewardedDidFailToLoad:(AMRewarded *)rewarded withError:(NSError *)error {
    NSLog(@"<AM>: Rewarded did fail to load with error: %@",error.localizedDescription);
}

- (void)AMRewardedDidShow:(AMRewarded *)rewarded {
    NSLog(@"<AM>: Rewarded did show.");
}

- (void)AMRewardedDidClick:(AMRewarded *)rewarded {
    NSLog(@"<AM>: Rewarded did click.");
}

- (void)AMRewardedDidClose:(AMRewarded *)rewarded {
    NSLog(@"<AM>: Rewarded did close.");
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)AMRewardedDidComplete:(AMRewarded *)rewarded withReward:(NSString *)name andAmount:(NSString *)amount {
    NSLog(@"<AM>: Rewarded did complete. User rewarded with %@ %@.",name,amount);
}

@end

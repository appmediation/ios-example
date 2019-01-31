//
//  MainScreen.m
//  AppmediationExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import "MainScreen.h"
#import "BannerView.h"
#import "CustomBannerView.h"
#import "InterstitialView.h"
#import "RewardedView.h"

@interface MainScreen ()

@end

@implementation MainScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setAccessibilityLabel:@"tableView"];
    [self.navigationItem.backBarButtonItem setIsAccessibilityElement:YES];
    [self.navigationItem.backBarButtonItem setAccessibilityLabel:@"Back"];
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"test");
    switch (indexPath.row) {
        case 0:
            [self navigateTo:Banner];
            break;
        case 1:
            [self navigateTo:CustomBanner];
            break;
        case 2:
            [self navigateTo:Interstitial];
            break;
        case 3:
            [self navigateTo:Rewarded];
            break;
        default:
            //
            break;
    }
}

#pragma mark - Navigation

- (void)navigateTo:(Destination)destination {
    UIViewController *destinationVC;
    switch (destination) {
        case Banner:
            destinationVC = [[BannerView alloc] init];
            break;
        case CustomBanner:
            destinationVC = [[CustomBannerView alloc] init];
            break;
        case Interstitial:
            destinationVC = [[InterstitialView alloc] init];
            break;
        case Rewarded:
            destinationVC = [[RewardedView alloc] init];
            break;
        default:
            destinationVC = nil;
            break;
    }
    [self.navigationController pushViewController:destinationVC animated:YES];
}

@end

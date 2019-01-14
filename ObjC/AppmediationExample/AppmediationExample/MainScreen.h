//
//  MainScreen.h
//  AppmediationExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainScreen : UITableViewController

typedef NS_ENUM(NSUInteger, Destination) {
    Banner,
    Interstitial,
    Rewarded
};

@end

NS_ASSUME_NONNULL_END

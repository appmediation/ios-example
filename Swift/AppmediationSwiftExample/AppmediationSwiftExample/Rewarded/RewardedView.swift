//
//  RewardedView.swift
//  AppmediationSwiftExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

import UIKit
import Appmediation.AMRewarded

class RewardedView: UIViewController, AMRewardedDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadRewarded()
    }
    
    // MARK: AMRewarded Implementation
    
    fileprivate func loadRewarded() {
        AMRewarded.setDelegate(self)
        AMRewarded.loadAd()
    }
    
    fileprivate func showRewarded() {
        if AMRewarded.isReady() {
            AMRewarded.present(from: self)
        } else {
            print("<AM>: Rewarded is not ready.")
        }
    }
    
    // MARK: AMRewarded Delegate (Optional)
    
    func amRewardedDidLoad(_ rewarded: AMRewarded!) {
        print("<AM>: Rewarded did load.")
        navigationController?.setNavigationBarHidden(true, animated: true)
        showRewarded()
    }
    
    func amRewardedDidFail(toLoad rewarded: AMRewarded!, withError error: Error!) {
        print("<AM>: Rewarded did fail to load with error: \(error.localizedDescription)")
    }
    
    func amRewardedDidShow(_ rewarded: AMRewarded!) {
        print("<AM>: Rewarded did show.")
    }
    
    func amRewardedDidClick(_ rewarded: AMRewarded!) {
        print("<AM>: Rewarded did click.")
    }
    
    func amRewardedDidClose(_ rewarded: AMRewarded!) {
        print("<AM>: Rewarded did close.")
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func amRewardedDidComplete(_ rewarded: AMRewarded!, withReward name: String!, andAmount amount: String!) {
        print("<AM>: Rewarded did complete. User rewarded with " + name + amount + ".")
    }
    
}

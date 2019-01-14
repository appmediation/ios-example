//
//  InterstitialView.swift
//  AppmediationSwiftExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

import UIKit
import Appmediation.AMInterstitial

class InterstitialView: UIViewController, AMInterstitialDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadInterstitial()
    }
    
    // MARK: AMInterstitial Implementation
    
    fileprivate func loadInterstitial() {
        AMInterstitial.setDelegate(self)
        AMInterstitial.loadAd()
    }
    
    fileprivate func showInterstitial() {
        if AMInterstitial.isReady() {
            AMInterstitial.present(from: self)
        } else {
            print("<AM>: Interstitial is not ready.")
        }
    }
    
    // MARK: AMInterstitial Delegate (Optional)
    
    func amInterstitialDidLoad(_ interstitial: AMInterstitial!) {
        print("<AM>: Interstitial did load.")
        navigationController?.setNavigationBarHidden(true, animated: true)
        showInterstitial()
    }
    
    func amInterstitialDidFail(toLoad interstitial: AMInterstitial!, withError error: Error!) {
        print("<AM>: Banner did fail to load with error: \(error.localizedDescription)")
    }
    
    func amInterstitialDidShow(_ interstitial: AMInterstitial!) {
        print("<AM>: Interstitial did show.")
    }
    
    func amInterstitialDidClick(_ interstitial: AMInterstitial!) {
        print("<AM>: Interstitial did click.")
    }
    
    func amInterstitialDidClose(_ interstitial: AMInterstitial!) {
        print("<AM>: Interstitial did close.")
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

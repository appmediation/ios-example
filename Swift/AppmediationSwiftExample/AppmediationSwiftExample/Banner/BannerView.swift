//
//  BannerView.swift
//  AppmediationSwiftExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

import UIKit
import Appmediation.AMBanner

class BannerView: UIViewController, AMBannerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadBanner()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // It is always good idea to remove objects before leaving the screen,
        // and re-add them when you are back to screen. So the system can
        // release memory for them if needed.
        removeBanner()
    }
    
    // MARK: AMBanner Implementation
    
    fileprivate func loadBanner() {
        AMBanner.setDelegate(self) // Optional
        AMBanner.show(.size_320x50, position: .Bottom, rootViewController: self)
    }
    
    fileprivate func removeBanner() {
        AMBanner.remove()
    }
    
    // MARK: AMBanner Delegate (Optional)
    
    func amBannerDidLoad(_ banner: AMBanner!) {
        print("<AM>: Banner did load.")
    }
    
    func amBannerDidFail(toLoad banner: AMBanner!, withError error: Error!) {
        print("<AM>: Banner did fail to load with error: \(error.localizedDescription)")
    }
    
    func amBannerDidShow(_ banner: AMBanner!) {
        print("<AM>: Banner did show.")
    }
    
    func amBannerDidClick(_ banner: AMBanner!) {
        print("<AM>: Banner did click.")
    }
}

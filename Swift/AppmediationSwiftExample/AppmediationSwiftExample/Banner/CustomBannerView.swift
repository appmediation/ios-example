//
//  CustomBannerView.swift
//  AppmediationSwiftExample
//
//  Created by Mert Celik on 1/31/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

import UIKit
import Appmediation.AMBanner

class CustomBannerView: UIViewController, AMBannerDelegate {
    
    var customView: UIView! = nil
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createCustomView()
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
    
    fileprivate func createCustomView() {
        // Create a banner container view and add it to middle of screen
        customView = UIView(frame: CGRect(x: 0, y: screenHeight/2, width: screenWidth, height: 100))
        customView.backgroundColor = .black
        view.addSubview(customView)
    }
    
    // MARK: AMBanner Implementation
    
    fileprivate func loadBanner() {
        AMBanner.setDelegate(self) // Optional
        customView.addSubview(AMBanner.sharedInstance())
        AMBanner.sharedInstance()?.frame = CGRect(x: 0, y: 0, width: 320, height: 50)
        AMBanner.loadAd()
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

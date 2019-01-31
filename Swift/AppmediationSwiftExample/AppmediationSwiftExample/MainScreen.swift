//
//  MainScreen.swift
//  AppmediationSwiftExample
//
//  Created by Mert Celik on 1/14/19.
//  Copyright © 2019 appmediation. All rights reserved.
//

import UIKit

class MainScreen: UITableViewController {
    
    enum Destination {
        case Banner
        case CustomBanner
        case Interstitial
        case Rewarded
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityLabel = "tableView"
        self.navigationItem.backBarButtonItem?.isAccessibilityElement = true
        self.navigationItem.backBarButtonItem?.accessibilityLabel = "Back"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigate(to: .Banner)
            break
        case 1:
            navigate(to: .CustomBanner)
            break
        case 2:
            navigate(to: .Interstitial)
            break
        case 3:
            navigate(to: .Rewarded)
            break
        default:
            break
        }
    }
    
    // MARK: Navigation
    
    fileprivate func navigate(to destination: Destination) {
        var destinationVC: UIViewController!
        switch destination {
        case .Banner:
            destinationVC = BannerView()
            break
        case .CustomBanner:
            destinationVC = CustomBannerView()
            break
        case .Interstitial:
            destinationVC = InterstitialView()
            break
        case .Rewarded:
            destinationVC = RewardedView()
            break
        }
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }

}

//
//  BannerAdmob.swift
//  admob test
//
//  Created by atheer on 2020-12-25.
//

import Foundation
import SwiftUI
import GoogleMobileAds

final class BannerAdmob: UIViewControllerRepresentable {
    @ObservedObject var bannerAdmobSize: BannerAdmobSize = .shared
    
    func makeUIViewController(context: Context) -> UIViewController {
        let banner = GADBannerView(adSize: bannerAdmobSize.adGADSize)
    
        let viewController = UIViewController()
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        banner.rootViewController = viewController
        viewController.view.addSubview(banner)
        viewController.view.frame = CGRect(origin: .zero, size: bannerAdmobSize.adGADSize.size)
        banner.load(GADRequest())

        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

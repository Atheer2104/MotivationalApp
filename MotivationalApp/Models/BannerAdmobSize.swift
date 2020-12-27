//
//  BannerAdmobSize.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-25.
//

import Foundation
import Combine
import GoogleMobileAds

class BannerAdmobSize: ObservableObject {
    
    static let shared = BannerAdmobSize()
    
    @Published var adGADSize: GADAdSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.size.width)
}

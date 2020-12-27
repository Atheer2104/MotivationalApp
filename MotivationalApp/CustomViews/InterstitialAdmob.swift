//
//  InterstialAdmob.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-26.
//

import Foundation
import SwiftUI
import GoogleMobileAds

class InterstitialAdmob: NSObject, GADInterstitialDelegate {
    var interstitial: GADInterstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
    @ObservedObject var webViewModel: WebViewModel = .shared
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        let request = GADRequest()
        self.interstitial.load(request)
        self.interstitial.delegate = self
        self.webViewModel.dismissedInterstitialAd = false
        self.webViewModel.willPresentInterstitialAd = false
    }
    
    func showAd(){
        if self.interstitial.isReady{
           let root = UIApplication.shared.windows.first?.rootViewController
           self.interstitial.present(fromRootViewController: root!)
        } else {
           print("Not Ready")
       }
    }
    
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
        self.webViewModel.willPresentInterstitialAd = true
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        self.webViewModel.dismissedInterstitialAd = true
        LoadInterstitial()
       
    }
}


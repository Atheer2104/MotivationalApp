//
//  RandomInterstitalAds.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-26.
//

import Foundation

class RandomInterstitalAds {
    final private let TargetChance: Float = 1/1000
    final private let range: ClosedRange<Float> = 0...1
    var previousIndex: Int = -1
    let interstitial: InterstitialAdmob
    
    init(){
        self.interstitial = InterstitialAdmob()
    }
    
    
    func generateRandomFloat(range: ClosedRange<Float>) -> Float{
        return Float.random(in: range)
    }
    
    func generateChangeOfShowingAd() -> Bool {
        let randomFloat: Float = generateRandomFloat(range: range)
        if randomFloat <= TargetChance {
            print("Show interstitial ad")
            return true
        }
        
        return false
    }
    
    func randomlyShowAd(currentIndex: Int) {
        if currentIndex != previousIndex {
            previousIndex = currentIndex
            let showAd: Bool = generateChangeOfShowingAd()
            if showAd {
                interstitial.showAd()
            }
        } else {
            print("SAME INDEX")
        }
        
        
        
    }
    

    
}

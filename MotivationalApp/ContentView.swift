//
//  ContentView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-07-16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bannerAdmobSize: BannerAdmobSize = .shared
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VideoPlayer()
                
            VideoPlayerAdditionalControlls()
                .padding(.top, 25)
            
            BannerAdmob()
                .frame(width: bannerAdmobSize.adGADSize.size.width, height: bannerAdmobSize.adGADSize.size.height, alignment: .center)
            
        }
        .background(Color(.black).ignoresSafeArea())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

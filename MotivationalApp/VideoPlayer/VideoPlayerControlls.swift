//
//  VideoPlayerControlls.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

struct VideoPlayerControlls: View {
    @Binding var isPlaying: Bool
    var webView: Webview
    
    var body: some View {
        HStack{
            
            Button(action: {
                print("previous")
            }, label: {
                Image("skipPreviousIcon")
                    .sizeShadowModifier(size: 44)
                    .padding()
            })
            
            Spacer()
            
            Button(action: {
                isPlaying ? webView.pauseVideo() : webView.playVideo()
                isPlaying.toggle()
            }, label: {
                Image(isPlaying ? "pauseIcon" : "playArrowIcon")
                    .sizeShadowModifier(size: 88)
            })
            
            Spacer()
            
            Button(action: {
                print("Next")
            }, label: {
                Image("skipNextIcon")
                    .sizeShadowModifier(size: 44)
                    .padding()
            })
            
        }
    }
}



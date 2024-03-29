//
//  VideoPlayerControlls.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

struct VideoPlayerControlls: View {
    @Binding var isPlaying: Bool
    @Binding var canSkip: Bool
    var counter: Int
    var webView: Webview
    
    var body: some View {
        HStack {
            
            Button(action: {
                if counter != 0 || canSkip {
                    webView.playPreviousVideo()
                }
            }, label: {
                Image("skipPreviousIcon")
                    .sizeShadowModifier(size: 44, shadowRadius: 10, shadowX: 4, shadowY: 5)
                    .padding()
            })
            .buttonStyle(SkipButtonsStyle())
            .animation(.easeInOut)
            
            Spacer()
            
            Button(action: {
                isPlaying ? webView.pauseVideo() : webView.playVideo()
                isPlaying.toggle()
                print(webView.webview.debugDescription)
            }, label: {
                Image(isPlaying ? "pauseIcon" : "playArrowIcon")
                    .sizeShadowModifier(size: 88, shadowRadius: 10, shadowX: 4, shadowY: 5)
                    .animation(Animation.easeOut(duration: 0.5))
            })
            .buttonStyle(playButtonStyle())
            .animation(.easeInOut)
            
            Spacer()
            
            Button(action: {
                webView.playNextVideo()
            }, label: {
                Image("skipNextIcon")
                    .sizeShadowModifier(size: 44, shadowRadius: 10, shadowX: 4, shadowY: 5)
                    .padding()
            })
            .buttonStyle(SkipButtonsStyle())
            .animation(.easeInOut)
        }
    }
}


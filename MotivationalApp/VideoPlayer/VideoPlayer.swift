//
//  VideoPlayer.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

struct VideoPlayer: View {
    
    @State private var isPlaying: Bool = true
    @State private var isSeeking: Bool = false
    @State private var seekValue: Double = 0
    @ObservedObject var webViewModel: WebViewModel = .shared
    var webView = Webview(web: nil, videoID: "extilsa-8Ts")
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            webView
                
            if webViewModel.didFinishLoading {
                VStack{
                    Spacer()
                    
                    VStack {
                        VideoPlayerControlls(isPlaying: $isPlaying, webView: webView)
                        
                        VideoProgressBar(seekValue: $seekValue, isSeeking: $isSeeking, webView: webView, webViewModel: webViewModel)
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                    }
                    .background(Color.black.opacity(0.25))
                    .onAppear{
                        webView.getVideoDuration()
                    }
                    
                    .onReceive(timer) { _ in
                        if !isSeeking && isPlaying {
                            webView.getElapsedTime()
                            seekValue = webViewModel.elapsedVideoTime
                        }
                        
                    }
                }
                
            }
        }
    }
}


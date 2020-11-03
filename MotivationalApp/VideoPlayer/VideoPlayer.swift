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
    @State private var skipped: Bool = false
    @ObservedObject var webViewModel: WebViewModel = .shared
    @EnvironmentObject var videoIDFetcher: VideoIDFetcher
    var webView = Webview(web: nil, videoID: "extilsa-8Ts")
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            webView
               
            .onChange(of: videoIDFetcher.videoIDs) { videosIDs in
                guard let firstVideoID = videosIDs.first else { return }
                webView.reloadHtml(videoID: firstVideoID, playlist: Array(videosIDs.dropFirst()))
            }
            
        
            
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
                    
                    .onReceive(webViewModel.$videoPlayerState) { state in
                        // unstarted
                        if state == -1 {
                            isPlaying = true
                            seekValue = 0
                        }
                        
                        //buffering
                        if state == 3 {
                            webView.getVideoDuration()
                            print("buffering")
                        }
                    }
                    
                    .onReceive(timer) { _ in
                        webView.getPlayerState()
                        
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


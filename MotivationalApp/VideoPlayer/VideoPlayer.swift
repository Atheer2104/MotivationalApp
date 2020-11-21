//
//  VideoPlayer.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI
import Combine

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
            
            /*.onChange(of: skipped) { hasSkipped in
                if hasSkipped {
                    //self.timer.upstream.connect().cancel()
                }
            }*/
            
            
            .onReceive(webViewModel.$playlistIndex) {index in
                if index == videoIDFetcher.maxResults {
                    print("we should fetch next list")
                }
            }
                
            .onReceive(webViewModel.$videoPlayerState) { state in
               
                
                // unstarted
                if state == -1 {
                    isPlaying = true
                    seekValue = 0
                    print("unstarted")
                   
                }
                
                //buffering
                if state == 3 {
                    webView.getVideoDuration()
                    webView.getPlaylistIndex()
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
            
            
            if webViewModel.didFinishLoading {
                VStack{
                    Spacer()
                    
                    ZStack(alignment: .bottom) {
                       VideoPlayerCoverUpYoutubeTrademarks(height: 100)
                        
                        VStack {
                            VideoPlayerControlls(isPlaying: $isPlaying, skipped: $skipped, webView: webView)
                            
                            VideoProgressBar(seekValue: $seekValue, isSeeking: $isSeeking, webView: webView, webViewModel: webViewModel)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                        
                    }
                    .background(Color.black.opacity(0.25))
                    
                }
            }
            

            VStack {
                VideoPlayerCoverUpYoutubeTrademarks(height: 40)
                
                Spacer()
            }
            
        }
    }
}

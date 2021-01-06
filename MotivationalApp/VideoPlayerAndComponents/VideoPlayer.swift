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
    @State private var canSkip: Bool = false
    @State var setDefaultValuesForFirstVideo: Bool = true
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @ObservedObject var webViewModel: WebViewModel = .shared
    @ObservedObject var videoIDFetcherInfo: VideoIDFetcherInfo = .shared
    var webView = Webview(web: nil, videoID: "extilsa-8Ts")
    var videoIDFetcher = VideoIDFetcher()
    let randomInterstitalAds = RandomInterstitalAds()

    
    var body: some View {
        ZStack {
            webView
               
            .onChange(of: videoIDFetcherInfo.videoIDs) { videosIDs in
                webView.loadPlaylist(playlist: videosIDs.joined(separator: ", "), indexToPlay: videoIDFetcherInfo.indexToPlay)
                self.setDefaultValuesForFirstVideo = true
            }
                
            .onChange(of: isPlaying) { isPlaying in
                if isPlaying {
                    self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                } else {
                    self.timer.upstream.connect().cancel()
                }
            }
                
            .onReceive(webViewModel.$dismissedInterstitialAd) { boolean in
                if boolean {
                    webView.playVideo()
                    webView.getPlayerState()
                }
            }
                
            .onReceive(webViewModel.$playlistIndex) {index in
                randomInterstitalAds.randomlyShowAd(currentIndex: index)
                
                
                if index == videoIDFetcher.maxResults + 1 {
                    print("we should fetch next list")
                    videoIDFetcher.fetchToken(nextToken: true)
                }
                
                if index == 0 {
                    print("we should fetch previous list")
                    videoIDFetcher.fetchToken(nextToken: false)
                    
                    // if some hwo by mistake we are on the first video and we don't have
                    // a prevToken then we play the first video (IllegalState)
                    if videoIDFetcherInfo.prevToken == "" {
                        webView.playVideoAt(index: 1)
                    }
                    
                }
                
                if index == 1 {
                    canSkip = false
                    webView.playVideo()
                    
                } else {
                    canSkip = true
                }

            }
                
            .onReceive(webViewModel.$videoPlayerState) { state in
                // unstarted
                if state == -1 {
                    webView.getPlaylistIndex()
                    webView.playVideo()
                    isPlaying = true
                    seekValue = 0
                    print("unstarted")
                   
                }
                //buffering
                if state == 3 {
                    if webViewModel.playlistIndex > 0 {
                        webView.getVideoDuration()
                        webView.getPlaylistIndex()
                        print("buffering")
                        
                        if webViewModel.willPresentInterstitialAd {
                            webView.pauseVideo()
                        }
                        
                    }
                }
                
                // playing
                // mainly for when video started playing we get the playlist index
                // so we can get videoduartion at the right time
                // else duration will be 1.0 because when it's get called we are playing next video
                // and we can't access any videoDuration so we get our default value which was for live videos
                if state == 1 {
                    if setDefaultValuesForFirstVideo {
                        seekValue = 0
                        webView.getVideoDuration()
                        self.setDefaultValuesForFirstVideo = false
                    }
                    
                    if webViewModel.playlistIndex < 1 {
                        webView.getPlaylistIndex()
                    }
                }
                
            }
            
            .onReceive(timer) { _ in
                webView.getPlayerState()
                
                if !isSeeking && isPlaying{
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
                        VideoPlayerControlls(isPlaying: $isPlaying, canSkip: $canSkip, counter: videoIDFetcherInfo.counter, webView: webView)
                        
                        VideoProgressBar(seekValue: $seekValue, isSeeking: $isSeeking, webView: webView, webViewModel: webViewModel)
                            .padding(.horizontal)
                            .padding(.bottom)
                    }
                }
                .background(Color.black.opacity(0.25))

                }
                // animation
                .transition(.opacity)
                } else {
                    SpinnerProgressIndicator()
                        .frame(width: 100, height: 100, alignment: .center)
                        //animation
                        .transition(.scale)
                }

            VStack {
                VideoPlayerCoverUpYoutubeTrademarks(height: 40)
                
                Spacer()
            }
        }
    }
}

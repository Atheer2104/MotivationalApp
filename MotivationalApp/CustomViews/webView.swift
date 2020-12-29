//
//  webView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-08-19.
//

import Foundation
import SwiftUI
import WebKit

struct Webview : UIViewRepresentable {
    
    @ObservedObject var webViewModel: WebViewModel = .shared
    var webview: WKWebView?
    var videoID: String
    let hardcodedPlaylist: [String] = ["EQIh607kd0Y", "A5kGigZHed4", "MLJyFzdQfK8", "Trfxm0TJwuQ", "nVVr7gJNny8", "XqZsoesa55w"]
    
    func createEmbededHtml(videoID: String, playlist: String) -> String {
            return """
                <!DOCTYPE html>
                   <html>
                   <style>
                       * { margin: 0; padding: 0; }
                       html, body { width: 100%; height: 100%; }
                   </style>
                    <body>
                      <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
                      <div id="player" ></div>



                      <script>
                        // 2. This code loads the IFrame Player API code asynchronously.
                        var tag = document.createElement('script');

                        tag.src = "https://www.youtube.com/iframe_api";
                        var firstScriptTag = document.getElementsByTagName('script')[0];
                        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                        // 3. This function creates an <iframe> (and YouTube player)
                        //    after the API code downloads.
                        var player;
                        function onYouTubeIframeAPIReady() {
                          player = new YT.Player('player', {
                            height: '100%',
                            width: '100%',
                            videoId: '\(videoID)',
                            playerVars: {
                               controls: 0,
                               rel: 0,
                               modestbranding: 1,
                               playsinline: 1,
                               enablejsapi: 1,
                               playlist: '\(playlist)'
                           },
                            events: {
                              'onReady': onPlayerReady
                            }
                          });
                        }

                        // 4. The API will call this function when the video player is ready.
                        function onPlayerReady(event) {
                           player.playVideoAt(1);
                        }

                      </script>
                    </body>
                   </html>
                """
    }
    
    init(web: WKWebView?, videoID: String) {
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        self.webview = WKWebView(frame: .zero, configuration: configuration)
        self.videoID = videoID
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let embededHtmlString = createEmbededHtml(videoID: videoID, playlist: hardcodedPlaylist.joined(separator: ", "))
        self.webview?.navigationDelegate = context.coordinator
        webview?.loadHTMLString(embededHtmlString, baseURL: nil)
        webview?.isUserInteractionEnabled = false
        webview?.isOpaque = false
        return webview!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var webViewModel: WebViewModel
        
        init(_ webViewModel: WebViewModel) {
            self.webViewModel = webViewModel
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("webview has loaded")
            self.webViewModel.didFinishLoading = true
        }
        
    }
    
    func makeCoordinator() -> Webview.Coordinator {
        Coordinator(webViewModel)
    }
    
    func playVideo() {
        webview?.evaluateJavaScript("player.playVideo()")
    }
    
    func pauseVideo() {
        webview?.evaluateJavaScript("player.pauseVideo()")
    }
    
    func seekVideo(Seconds seekValue: Double) {
        webview?.evaluateJavaScript("player.seekTo(\(seekValue))")
    }
    
    func getVideoDuration() {
        webview?.evaluateJavaScript("player.getDuration()") { result, error in
            if let result = result as? Double{
                // for live videos only 
                if result == 0.0 {
                    self.webViewModel.durationOfVideo = 1.0
                    print("LIVE VIDEO")
                } else {
                    self.webViewModel.durationOfVideo = result.rounded()
                }
                
            }
        }
    }
    
    func getElapsedTime() {
        webview?.evaluateJavaScript("player.getCurrentTime()") { result, error in
            if let result = result as? Double {
                self.webViewModel.elapsedVideoTime = result.rounded()
            }

        }
    }
    
    func playNextVideo() {
        webview?.evaluateJavaScript("player.nextVideo()")
    }
    
    func playPreviousVideo() {
        webview?.evaluateJavaScript("player.previousVideo()")
    }
    
    func getPlayerState() {
        webview?.evaluateJavaScript("player.getPlayerState()") { result, error in
            if let result = result as? Int {
                self.webViewModel.videoPlayerState = result
            }
        }
    }
    
    func getPlaylistIndex() {
        webview?.evaluateJavaScript("player.getPlaylistIndex()") { result, error in
            if let result = result as? Int {
                self.webViewModel.playlistIndex = result
                
            }
        }
    }
    
    func reloadHtml(videoID: String, playlist: [String]) {
        let embededHtmlString = createEmbededHtml(videoID: videoID, playlist: playlist.joined(separator: ", "))
        webview?.loadHTMLString(embededHtmlString, baseURL: nil)
        print("reloaded html")
    }
    
    func playVideoAt(index: Int) {
        webview?.evaluateJavaScript("player.playVideoAt(\(index))")
    }
    
    func loadPlaylist(playlist: String, indexToPlay: Int) {
        webview?.evaluateJavaScript("player.loadPlaylist('\(playlist)', \(indexToPlay))")
    }
    

}

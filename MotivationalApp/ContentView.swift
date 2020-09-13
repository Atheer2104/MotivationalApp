//
//  ContentView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-07-16.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var isPlaying: Bool = true
    @State private var seekValue: Double = 0
    @ObservedObject var webViewModel: WebViewModel = .shared
    var webView = Webview(web: nil, videoID: "extilsa-8Ts")
    
    var body: some View {
        
        ZStack {
            webView
                
            if webViewModel.didFinishLoading {
                VStack {
                                        
                    HStack{

                        Button(action: {
                            print("previous")
                            webView.getVideoState()
                            //print(webViewYTModel.vidoePlayerState)
                        }, label: {
                            Image("skipPreviousIcon")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 4, y: 5)
                                .padding()
                                
                        })

                        Spacer()
                        
                        Button(action: {
                            isPlaying ? webView.pauseVideo() : webView.playVideo()
                            isPlaying.toggle()
                        }, label: {
                            Image(isPlaying ? "pauseIcon" : "playArrowIcon")
                                .resizable()
                                .frame(width: 88, height: 88)
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 4, y: 5)
                                
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            //webView.getVideoDuration()
                            print("inside content view")
                            print(webViewModel.videoDuration)
                        }, label: {
                            Image("skipNextIcon")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 4, y: 5)
                                .padding()
                        })
                        
                    }
                    
                    Slider(value: $seekValue, in: 0...webViewModel.videoDuration, step: 1, onEditingChanged: { _ in
                        print(seekValue)
                        webView.seekVideo(Seconds: seekValue)
                
                    })
                        .accentColor(Color(UIColor.systemIndigo))
                 
                   
                }
                .background(Color.black.opacity(0.25))
                .onAppear{
                    webView.getVideoDuration()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





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
    //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                            webView.getElapsedTime()
                            if webViewModel.videoElapsedRetrived {
                                print("inside contentView")
                                print(webViewModel.videoElapsed)
                            }
                        }, label: {
                            Image("skipNextIcon")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 4, y: 5)
                                .padding()
                        })
                        
                    }
                    
                    Slider(value: $seekValue, in: 0...webViewModel.videoDuration, step: 1, onEditingChanged: { edited in
                        // i want to only seek video when the user has stopped dragging the slider
                        // that happens when onEditingChanged is false
                        if !edited {
                            webView.seekVideo(Seconds: seekValue)
                        }
                    })
                    .accentColor(Color(UIColor.systemIndigo))
                 
                   
                }
                .background(Color.black.opacity(0.25))
                .onAppear{
                    webView.getVideoDuration()
                    //webView.getElapsedTime()
                    
                }
                /*
                .onReceive(timer) { _ in
                    webView.getElapsedTime()
                }*/
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





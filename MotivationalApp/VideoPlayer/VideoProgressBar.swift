//
//  VideoProgressBar.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

struct VideoProgressBar: View {
    @Binding var seekValue: Double
    @Binding var isSeeking: Bool
    var webView: Webview
    var webViewModel: WebViewModel
    
    var body: some View {
        Slider(value: $seekValue, in: 0...webViewModel.durationOfVideo, step: 1, onEditingChanged: { edited in
            // I want to only seek video when the user has stopped dragging the slider
            // that happens when onEditingChanged is false
            if edited {
                isSeeking = true
            } else {
                isSeeking = false
                webView.seekVideo(Seconds: seekValue)
                // because we did seek into the video we need to reset the videoElapsed
                // to our seekValue where we seek into the video is also
                // how far the video has been elapsed
                webViewModel.elapsedVideoTime = seekValue
                
            }
        })
        .accentColor(Color(UIColor.systemIndigo))
    }
}



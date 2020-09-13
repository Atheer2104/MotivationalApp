//
//  WebViewVideoModel.swift
//  MotivationalApp
//
//  Created by atheer on 2020-08-31.
//

import Foundation
import Combine

class WebViewVideoModel: ObservableObject {
    @Published var videoDuration: Double = 0
    @Published var vidoePlayerState: Double = -1
   
}

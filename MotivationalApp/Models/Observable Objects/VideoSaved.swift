//
//  VideoSaved.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-16.
//

import Foundation
import Combine

class VideoSaved: ObservableObject {
    private init() {}
    
    static let shared = VideoSaved()
    
    @Published var isVideoSaved: Bool = false
}

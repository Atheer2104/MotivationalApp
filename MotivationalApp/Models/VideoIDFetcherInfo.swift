//
//  VideoIDFetcherInfo.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-22.
//

import Foundation
import Combine

class VideoIDFetcherInfo: ObservableObject {
    private init() { }
    
    static let shared = VideoIDFetcherInfo()
    
    @Published var videoIDs: [String] = [""]
    @Published var counter: Int = 0
    @Published var indexToPlay: Int = 1
    @Published var nextToken: String = ""
    @Published var prevToken: String = ""
    @Published var searchTerm: String = ""
    @Published var fetchingNewCategory: Bool = false 
    
}

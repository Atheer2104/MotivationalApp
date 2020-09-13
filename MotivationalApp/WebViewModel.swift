//
//  WebViewModel.swift
//  MotivationalApp
//
//  Created by atheer on 2020-08-30.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
    private init() { }
    
    static let shared = WebViewModel()
    
    @Published var didFinishLoading: Bool = false
    @Published var videoDuration: Double = 1.0
    
    
}

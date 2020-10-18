//
//  VideoIDFetcher.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-17.
//

import Foundation
import Combine

class VideoIDFetcher: ObservableObject {
    
    @Published var regionCode: String = ""
    @Published var isDataReady: Bool = false
    
    private let apiKey: String = "AIzaSyBw4L0BJoyUIolpzXx9CsMp8ecIjAkjhVQ"
    private let part: String = "id"
    private let maxResults: String = "6"
    private let searchTerm: String = "ragnar%20lothbrok%20motivation"
    private let type: String = "video"
    private let videoEmbeddable: String = "true"
    
    func fetch() {
        guard let Url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id&maxResults=6&q=ragnar%20lothbrok%20motivation&type=video&videoEmbeddable=true&key=AIzaSyBw4L0BJoyUIolpzXx9CsMp8ecIjAkjhVQ") else { return }
        
        URLSession.shared.dataTask(with: Url) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                
                guard let data = data else { return }
                
                let result = try! JSONDecoder().decode(feed.self, from: data)
                
                DispatchQueue.main.async {
                    print(result.items.map({ $0.id.videoId }))
                }
            }
        }.resume()
        self.isDataReady = true 
    }
}

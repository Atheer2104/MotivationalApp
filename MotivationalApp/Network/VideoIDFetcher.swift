//
//  VideoIDFetcher.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-31.
//

import Foundation
import Combine

class VideoIDFetcher: ObservableObject {
    
    @Published var videoIDs: [String] = [""]
    
    private let apiKey: String = "AIzaSyBw4L0BJoyUIolpzXx9CsMp8ecIjAkjhVQ"
    private let maxResults: String = "6"
    private let searchTerm: String = "ragnar%20lothbrok%20motivation"

    func fetch(search q: String) {
       
        guard let Url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id&maxResults=\(maxResults)&q=\(q.replacingOccurrences(of: " ", with: "%20"))&type=video&videoEmbeddable=true&key=\(apiKey)") else { return }
        
        URLSession.shared.dataTask(with: Url) { data, response, error in
            if error != nil {
                print(error!)
            } else {
                
                guard let data = data else { return }
                
                let result = try! JSONDecoder().decode(feed.self, from: data)
                
                DispatchQueue.main.async {
                    self.videoIDs = result.items.map({ $0.id.videoId })
                    
                }
            }
        }.resume()
    }
}

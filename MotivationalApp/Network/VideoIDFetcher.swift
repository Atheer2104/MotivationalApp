//
//  VideoIDFetcher.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-31.
//

import Foundation
import SwiftUI

class VideoIDFetcher {
 
    @ObservedObject var videoIDFetcherInfo: VideoIDFetcherInfo = .shared
    private let apiKey: String = "AIzaSyBw4L0BJoyUIolpzXx9CsMp8ecIjAkjhVQ"
    let maxResults: Int = 6
    let placeholderVideoID: String = "XqZsoesa55w"
    
    func fetch<T: Codable>(Url: URL, modelType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: Url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    completion(Result { try JSONDecoder().decode(T.self, from: data)})
                }
            }
        }.resume()
    }
    
    func handleData(tempArr: inout [String]) {
        print("Counter " + String(self.videoIDFetcherInfo.counter))
        // we are appending a placeholder videoid so we know we are the list is over so we can fetch the next one
        tempArr.append(placeholderVideoID)
        // placeholder value
        tempArr.insert(placeholderVideoID, at: 0)
        self.videoIDFetcherInfo.videoIDs = tempArr
    }
    
    
    func fetchStart(search q: String) {
        self.videoIDFetcherInfo.searchTerm = q
        self.videoIDFetcherInfo.counter = 0
        print("fetch start")
        
        guard let Url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id&maxResults=\(maxResults)&q=\(q.replacingOccurrences(of: " ", with: "%20"))&type=video&videoEmbeddable=true&key=\(apiKey)") else { return }
        
        fetch(Url: Url, modelType: startFeed.self) { result in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let result):
                    var tempArr: [String] = result.items.map({ $0.id.videoId })
                    self.videoIDFetcherInfo.nextToken = result.nextPageToken
                    self.handleData(tempArr: &tempArr)
            }
        }
    }
    
    func fetchToken(nextToken: Bool) {
        var Url: URL?
        print("fetch continue")
        
        if nextToken {
            self.videoIDFetcherInfo.counter += 1
            self.videoIDFetcherInfo.indexToPlay = 1
            Url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id&pageToken=\(self.videoIDFetcherInfo.nextToken)&maxResults=\(maxResults)&q=\(self.videoIDFetcherInfo.searchTerm.replacingOccurrences(of: " ", with: "%20"))&type=video&videoEmbeddable=true&key=\(apiKey)")
            
        } else {
            self.videoIDFetcherInfo.counter -= 1
            self.videoIDFetcherInfo.indexToPlay = 6
            Url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id&pageToken=\(self.videoIDFetcherInfo.prevToken)&maxResults=\(maxResults)&q=\(self.videoIDFetcherInfo.searchTerm.replacingOccurrences(of: " ", with: "%20"))&type=video&videoEmbeddable=true&key=\(apiKey)")
        }
        
        
        if self.videoIDFetcherInfo.counter == 0 {
            fetchStart(search: self.videoIDFetcherInfo.searchTerm)
        } else {
            fetch(Url: Url!, modelType: feed.self) { result in
                switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let result):
                        var tempArr: [String] = result.items.map({ $0.id.videoId })
                        self.videoIDFetcherInfo.nextToken = result.nextPageToken
                        self.videoIDFetcherInfo.prevToken = result.prevPageToken
                        self.handleData(tempArr: &tempArr)
                }
            }
        }
    }
    
    

}

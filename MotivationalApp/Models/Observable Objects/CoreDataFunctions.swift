//
//  CoreDataFunctions.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-15.
//

import Foundation
import Combine
import SwiftUI
import CoreData
import Kingfisher


class CoreDataFunctions: ObservableObject {
    var managedObjectContext: NSManagedObjectContext
    let cache = ImageCache.default
    @ObservedObject var videoSaved: VideoSaved = .shared
    @Published var showAlert: Bool = false
    
    init(context: NSManagedObjectContext) {
        self.managedObjectContext = context
    }
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        
        } catch {
            print("There was an error saving")
            self.showAlert = true
        }
    }
    
    func saveVideo(videoID: String, title: String, thumbnailUrlString urlString: String) {
        let newVideo = Video(context: managedObjectContext)
        
        newVideo.thumbnailUrlString = urlString
        newVideo.title = title
        newVideo.videoID = videoID
        newVideo.createdAt = Date()
        
        videoSaved.isVideoSaved = true
        
        
        saveContext()
    }
    
    
    func deleteVideo(savedVideo: FetchedResults<Video>, thumbnailUrlString: String, index: Int) {
        let video = savedVideo[index]
        
        self.managedObjectContext.delete(video)
        
        videoSaved.isVideoSaved = false
        cache.removeImage(forKey: thumbnailUrlString)

        saveContext()
        
    }
    
    
}

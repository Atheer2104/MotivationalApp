//
//  BookmarkOverlayView.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-09.
//

import SwiftUI
import CoreData

struct BookmarkOverlayView: View {
    var coreDataFunctions: CoreDataFunctions
    let savedVideoID: String
    let savedVideoTitle: String
    let index: Int
    let savedVideos: FetchedResults<Video>
    let thumbnailUrlString: String
    
    
    init(savedVideoID: String, savedVideoTitle: String, thumbnailUrlString: String, index: Int, savedVideos: FetchedResults<Video>, context: NSManagedObjectContext) {
        self.savedVideoID = savedVideoID
        self.savedVideoTitle = savedVideoTitle
        self.thumbnailUrlString = thumbnailUrlString
        self.index = index
        self.savedVideos = savedVideos
        self.coreDataFunctions = CoreDataFunctions(context: context)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(savedVideoTitle)
                .foregroundColor(.primary)
                .font(.headline)
                .fontWeight(.bold)
        
            Spacer()
            
            Button(action: {
                coreDataFunctions.deleteVideo(savedVideo: savedVideos, thumbnailUrlString: thumbnailUrlString, index: index)
                
            }, label: {
                Image(systemName: "trash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 44, height: 44)
            })
            .buttonStyle(DeleteButtonStyle())
            .animation(.easeInOut)
            
            Spacer()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, idealHeight: 55, maxHeight: 60)
    }
}

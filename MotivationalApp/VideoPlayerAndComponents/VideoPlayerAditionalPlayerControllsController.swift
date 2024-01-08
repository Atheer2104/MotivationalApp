//
//  VideoPlayerAditionalPlayerControllsController.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-17.
//

import SwiftUI
import CoreData

struct VideoPlayerAditionalPlayerControllsController: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Video.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Video.createdAt, ascending: true)])
    var savedVideos: FetchedResults<Video>
    
    var body: some View {
        VideoPlayerAdditionalControlls(context: managedObjectContext, savedVideos: savedVideos)
            .padding(.top, 25)
    }
}


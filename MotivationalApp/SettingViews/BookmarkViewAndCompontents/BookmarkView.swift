//
//  BookmarkView.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-06.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    @ObservedObject var videoIDFetcherInfo: VideoIDFetcherInfo = .shared
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Video.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Video.createdAt, ascending: true)])
    var savedVideos: FetchedResults<Video>
    let cornerRadius: CGFloat = 25
    @Binding var isShowingBookmarkView: Bool
    
    var body: some View {
        if (self.savedVideos.isEmpty) {
            NoBookmarkedView()
        } else {
            VStack {
                Indicator()
                    .padding()
                    
                Divider()
                    .background(Color.primary)
                
                if self.savedVideos.count > 1 {
                    Text("Bookmarks")
                        .bold()
                        .modifier(BookmarkViewTitleModifier())
                        
                } else {
                    Text("Bookmark")
                        .bold()
                        .modifier(BookmarkViewTitleModifier())
                }
                
            
                ScrollView(.vertical) {
                    ForEach(Array(savedVideos.enumerated()), id: \.offset) { index, savedVideo in
            
                        VStack {
                            ZStack(alignment: .bottom) {
                                BookmarkViewImage(urlString: savedVideo.thumbnailUrlString!, radius: cornerRadius)
                                
                                BookmarkViewOverlay(radius: cornerRadius)
                                    .shadow(color: Color.black.opacity(0.35), radius: 4, x: 0, y: 4)
                                    
                                BookmarkOverlayView(savedVideoID: savedVideo.videoID!, savedVideoTitle: savedVideo.title!, thumbnailUrlString: savedVideo.thumbnailUrlString!,index: index, savedVideos: savedVideos, context: managedObjectContext)
                            }
                            .padding(.bottom, 21)
                            .padding(.horizontal)
                                
                        }
                        .onTapGesture {
                            self.videoIDFetcherInfo.videoIDs.removeAll()
                            
                            for (_, savedVideo) in savedVideos.enumerated() {
                                guard let savedVideoID = savedVideo.videoID else { return }
                                self.videoIDFetcherInfo.videoIDs.append(savedVideoID)
                            }
                            
                            self.videoIDFetcherInfo.isPlayingSavedVideos = true
                            
                            self.isShowingBookmarkView = false
                            categoryViewSettings.isShowingSettingView = false
                        }
                        
                        
                    }
                    
                    
                }
            }
            .background(Color(.systemGray3).ignoresSafeArea())
        }
    }
}

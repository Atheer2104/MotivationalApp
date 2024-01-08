//
//  VideoPlayerAdditionalControlls.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-18.
//

import SwiftUI
import CoreData

struct VideoPlayerAdditionalControlls: View {
    var managedObjectContext: NSManagedObjectContext
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    @ObservedObject var webViewModel: WebViewModel = .shared
    @ObservedObject var videoIDFetcherInfo: VideoIDFetcherInfo = .shared
    @ObservedObject var videoSaved: VideoSaved = .shared
    @ObservedObject var coreDataFunctions: CoreDataFunctions
    let savedVideos: FetchedResults<Video>
    
    init(context: NSManagedObjectContext, savedVideos: FetchedResults<Video>) {
        self.managedObjectContext = context
        self.coreDataFunctions = CoreDataFunctions(context: context)
        self.savedVideos = savedVideos
    }
    
    var body: some View {
        VStack {
        
            Button(action: {
                categoryViewSettings.isShowingCategoryView.toggle()
            }, label: {
                Image("category")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            .buttonStyle(VideoPlayerSaveVideoButtonStyle())
            .animation(.easeInOut)
            .sheet(isPresented: $categoryViewSettings.isShowingCategoryView, content: {
                CategoryView()
            })
            
            Spacer()
            
            Button(action: {
                if !videoSaved.isVideoSaved {
                    
                let currentIndex = webViewModel.playlistIndex - 1
                    coreDataFunctions.saveVideo(videoID: videoIDFetcherInfo.videoIDs[currentIndex + 1] ,title: videoIDFetcherInfo.videoTitles[currentIndex], thumbnailUrlString: videoIDFetcherInfo.VideoThumbnailsUrl[currentIndex])
                    print("saving")
                } else {
                    
                    let currentIndex = webViewModel.playlistIndex - 1
                    var indexToDelete: Int = 0
                    let currentVideoID: String = videoIDFetcherInfo.videoIDs[currentIndex + 1]
                    let currentVideoThumbnailUrl: String = videoIDFetcherInfo.VideoThumbnailsUrl[currentIndex]
                    for (index, savedVideo) in savedVideos.enumerated() {
                        guard let savedVideoID = savedVideo.videoID else { return }
                        if savedVideoID == currentVideoID {
                            indexToDelete = index
                        }
                    }
                    
                    coreDataFunctions.deleteVideo(savedVideo: savedVideos, thumbnailUrlString: currentVideoThumbnailUrl, index: indexToDelete)
                }
            }, label: {
                Image(videoSaved.isVideoSaved ? "bookmark-border-filled" : "bookmark-border")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            .alert(isPresented: $coreDataFunctions.showAlert, content: {
                Alert(title: Text("aaaaaa"), message: Text("dedededede"), dismissButton: .default(Text("xxxxxxx")))
                
            })
            .buttonStyle(VideoPlayerSaveVideoButtonStyle())
            .animation(.easeInOut)
            
            Spacer()
            
            Button(action: {
                categoryViewSettings.isShowingSettingView.toggle()
            }, label: {
                Image("settings")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            .buttonStyle(SettingButtonStyle())
            .animation(.easeInOut)
            .sheet(isPresented: $categoryViewSettings.isShowingSettingView, content: {
                SettingView()
            })
            
        }
        .frame(width: 44, height: 160)
        .padding(.top, 50)
        .padding(.horizontal)
        
    }
}

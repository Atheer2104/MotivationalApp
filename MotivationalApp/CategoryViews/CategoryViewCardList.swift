//
//  CategoryViewCardList.swift
//  MotivationalApp
//
//  Created by atheer on 2020-11-01.
//

import SwiftUI

struct CategoryViewCardList: View {
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    @ObservedObject var videoIDFetcherInfo: VideoIDFetcherInfo = .shared
    let data: [CategoryViewData]
    let range: Range<Int>
    var videoIDFetcher = VideoIDFetcher()
    
    var body: some View {
        ForEach(range) { index in
            Button(action: {
                categoryViewSettings.isShowingCategoryView = false
                videoIDFetcher.fetchStart(search: "\(data[index].youtubeSearchTerm)")
                videoIDFetcherInfo.isPlayingSavedVideos = false
            
            }, label: {
                CategoryViewCard(categoryTitleName: data[index].categoryTitleName, categoryImageName: data[index].categoryImageName)
            })
            .buttonStyle(CategoryViewCardButtonStyle())
            
            
        }
    }
}

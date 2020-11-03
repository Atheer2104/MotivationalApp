//
//  CategoryViewCardList.swift
//  MotivationalApp
//
//  Created by atheer on 2020-11-01.
//

import SwiftUI

struct CategoryViewCardList: View {
    let data: [hardcodedCategoryViewData]
    let range: Range<Int>
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    @EnvironmentObject var videoIDFetcher: VideoIDFetcher
    
    var body: some View {
        ForEach(0..<data.count/2) { index in
            Button(action: {
                categoryViewSettings.isShowingCategoryView.toggle()
                videoIDFetcher.fetch(search: "\(data[index].categoryTitleName) Motivation")
            }, label: {
                CategoryViewCard(categoryTitleName: data[index].categoryTitleName, categoryImageName: data[index].categoryImageName)
            })
        }
    }
}

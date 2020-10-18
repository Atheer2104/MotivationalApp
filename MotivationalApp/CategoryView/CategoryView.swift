//
//  CategoryView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var videoIDFetcher = VideoIDFetcher()
    
    var body: some View {
        VStack {
            CategoryViewSection(header: "Productivity", data: productivityCategoryData)
                .padding(.top)
            
            Spacer()
            
            CategoryViewSection(header: "Hard Times", data: hardtimesCategoryData)
            
            Spacer()
            
            CategoryViewSection(header: "Relationships", data: relationshipsCategoryData)
                .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                videoIDFetcher.fetch()
            }, label: {
                Text("Fetch")
            })
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

struct hardcodedCategoryViewData: Identifiable {
    var id = UUID()
    var categoryTitleName: String
    var categoryImageName: String
    var youtubeSearchTerm: String
    var videoIDs: [String]
}

var productivityCategoryData = [
    
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"]),
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"]),
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"]),
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"]),
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"]),
    hardcodedCategoryViewData(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder", youtubeSearchTerm: "Study", videoIDs: ["MLJyFzdQfK8", "IGnoxboek3g", "LXag0BtRgn0", "4bjo_WYgRd0", "B6vcJFmRiXI"])
    
]


var hardtimesCategoryData = [
    
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"]),
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"]),
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"]),
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"]),
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"]),
    hardcodedCategoryViewData(categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2", youtubeSearchTerm: "Stress", videoIDs: ["5QbtU8daKc8", "BfdvbZFXbNA", "JP56Y4HK3zY", "00CwaoWwcEk", "ga-MniJxQz8"])

]


var relationshipsCategoryData = [
    
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"]),
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"]),
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"]),
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"]),
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"]),
    hardcodedCategoryViewData(categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3", youtubeSearchTerm: "friendship", videoIDs: ["jsSMqvHBkQs", "47S1K8M4tQ4", "VnxsEYI-ZWI", "1Xs4JXfeV_s", "7Ng9lpOfb-Q"])
    
]

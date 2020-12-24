//
//  CategoryViewData.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-23.
//

import Foundation

struct CategoryViewData: Identifiable {
    var id = UUID()
    var categoryTitleName: String
    var categoryImageName: String
    var youtubeSearchTerm: String
}

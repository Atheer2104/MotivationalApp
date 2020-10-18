//
//  CategoryViewSettings.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-18.
//

import Foundation
import Combine

class CategoryViewSettings: ObservableObject {
    let objectWillChange = PassthroughSubject<CategoryViewSettings, Never>()
    
    var isShowingCategoryView: Bool = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    
}

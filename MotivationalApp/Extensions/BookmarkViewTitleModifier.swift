//
//  BookmarkViewTitleModifier.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-25.
//

import Foundation
import SwiftUI

struct BookmarkViewTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.primary)
    }
}

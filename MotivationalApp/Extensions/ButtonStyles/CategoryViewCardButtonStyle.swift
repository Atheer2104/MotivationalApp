//
//  CategoryViewCardButtonStyle.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-25.
//

import Foundation
import SwiftUI

struct CategoryViewCardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

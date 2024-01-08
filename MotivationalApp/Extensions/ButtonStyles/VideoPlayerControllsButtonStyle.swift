//
//  VideoPlayerControllsButtonStyle.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-25.
//

import Foundation
import SwiftUI


struct SkipButtonsStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
    }
}

struct playButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}

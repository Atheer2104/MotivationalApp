//
//  VideoPlayerAdditionalControllsButtonStyle.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-25.
//

import Foundation
import SwiftUI

struct VideoPlayerSaveVideoButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .scaleEffect(configuration.isPressed ? 0.90 : 1)
    }
}

struct SettingButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(VideoPlayerSaveVideoButtonStyle())
            .rotationEffect(configuration.isPressed ? Angle(degrees: 65) : Angle(degrees: 0))
    }
}


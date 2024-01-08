//
//  DeleteButtonStyle.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-25.
//

import Foundation
import SwiftUI

struct DeleteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.red : Color.white)
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            
    }
}

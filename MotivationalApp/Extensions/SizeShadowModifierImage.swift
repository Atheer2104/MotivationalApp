//
//  SizeShadowModifierImage.swift.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

extension Image {
    func sizeShadowModifier(size: CGFloat, shadowRadius: CGFloat, shadowX: CGFloat, shadowY: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
            .shadow(color: Color.black.opacity(0.15), radius: shadowRadius, x: shadowX, y: shadowY)
        
    }
}

//
//  ImageExt.swift
//  MotivationalApp
//
//  Created by atheer on 2020-09-20.
//

import SwiftUI

extension Image {
    func sizeShadowModifier(size: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: size, height: size)
            .shadow(color: Color.black.opacity(0.15), radius: 10, x: 4, y: 5)
    }
}

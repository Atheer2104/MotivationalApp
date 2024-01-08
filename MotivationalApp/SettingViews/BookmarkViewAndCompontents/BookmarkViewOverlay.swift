//
//  BookmarkViewOverlay.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-09.
//

import SwiftUI

struct BookmarkViewOverlay: View {
    let color1: Color = Color(UIColor.systemIndigo)
    let color2: Color = Color(red: 154 / 255, green: 45 / 255, blue: 138 / 255)
    let radius: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .bottomTrailing, endPoint: .topLeading))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, idealHeight: 55, maxHeight: 60)
            .cornerRadius(radius)
        
    }
}


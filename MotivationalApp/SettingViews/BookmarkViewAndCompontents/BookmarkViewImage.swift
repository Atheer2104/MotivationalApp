//
//  BookmarkViewImage.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-09.
//

import SwiftUI
import Kingfisher


struct BookmarkViewImage: View {
    let urlString: String
    let radius: CGFloat
    
    var body: some View {
        KFImage
            .url(URL(string: urlString))
            .placeholder {
                Image("black-template-image")
                    .resizable()
            }
            .renderingMode(.original)
            .resizable()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 175, idealHeight: 180, maxHeight: 185)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(radius)
            
            
    }
}

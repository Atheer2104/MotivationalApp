//
//  Bookmarks.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import SwiftUI

struct Bookmarks: View {
    var body: some View {
        HStack {
            SettingsViewLabel(title: "Bookmarks", imageName: "bookmarks")
            
            Spacer()
            
            Image("chevronRight")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
        }
        .padding()
    }
}

struct Bookmarks_Previews: PreviewProvider {
    static var previews: some View {
        Bookmarks()
    }
}

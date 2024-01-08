//
//  Bookmarks.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import SwiftUI

struct Bookmarks: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isShowingBookmarkView = false
    @State var title: String = "Bookmark"
    
    var body: some View {
        HStack {

            Button(action: {
                self.isShowingBookmarkView = true
            }, label: {
                SettingsViewLabel(title: title, imageName: "bookmarks")
                
            })
            .sheet(isPresented: $isShowingBookmarkView, content: {
                BookmarkView(isShowingBookmarkView: $isShowingBookmarkView)
                    .environment(\.managedObjectContext, managedObjectContext)
            })
            
            
            Spacer()
            
            Image("chevronRight")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
        }
        .padding()
    }
}

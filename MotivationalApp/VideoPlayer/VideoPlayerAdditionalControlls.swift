//
//  VideoPlayerAdditionalControlls.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-18.
//

import SwiftUI

struct VideoPlayerAdditionalControlls: View {
    //@State var isShowingCategoryView: Bool = false
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    
    var body: some View {
        
        VStack {
            Button(action: {
                //isShowingCategoryView.toggle()
                categoryViewSettings.isShowingCategoryView.toggle()
            }, label: {
                Image("category")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            .sheet(isPresented: $categoryViewSettings.isShowingCategoryView, content: {
                CategoryView()
            })
            
            Spacer()
            
            Button(action: {
                print("bookmarked")
            }, label: {
                Image("bookmark-border-filled")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            
            Spacer()
            
            Button(action: {
                print("settings")
            }, label: {
                Image("settings")
                    .sizeShadowModifier(size: 44, shadowRadius: 12, shadowX: 2, shadowY: 6)
            })
            
        }
        .frame(width: 44, height: 160)
        .padding(.top, 50)
        .padding(.horizontal)
        
    }
}

struct VideoPlayerAdditonalControlls_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerAdditionalControlls()
    }
}
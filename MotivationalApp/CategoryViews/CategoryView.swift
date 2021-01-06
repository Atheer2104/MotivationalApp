//
//  CategoryView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Indicator()
                .padding()
            
            Divider()
                .background(Color.primary)
                
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    CategoryViewSection(header: "Productivity", data: MotivationalSpeakersCategoryData)
                        .padding(.top)
                    
                    Spacer()
                    
                    CategoryViewSection(header: "Hard Times", data: Topics)
                    
                    Spacer()
                    
                    CategoryViewSection(header: "Relationships", data: MotivationFigures)
                        .padding(.bottom)
                    
                    Spacer()
                    
                }
            }
        }
        .background(Color(.systemGray3).ignoresSafeArea())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}



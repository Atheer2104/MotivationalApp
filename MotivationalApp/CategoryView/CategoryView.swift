//
//  CategoryView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            CategoryViewSection(header: "Productivity", categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder")
                .padding(.top)
            
            Spacer()
            
            CategoryViewSection(header: "Hard Times", categoryTitleName: "Stress", categoryImageName: "categoryImagePlaceholder2")
            
            Spacer()
            
            CategoryViewSection(header: "Relationships", categoryTitleName: "Friendship", categoryImageName: "categoryImagePlaceholder3")
                .padding(.bottom)
            
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

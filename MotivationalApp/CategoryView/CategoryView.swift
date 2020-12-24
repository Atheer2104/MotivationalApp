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
            CategoryViewSection(header: "Productivity", data: ProductivityCategoryData)
                .padding(.top)
            
            Spacer()
            
            CategoryViewSection(header: "Hard Times", data: HardtimesCategoryData)
            
            Spacer()
            
            CategoryViewSection(header: "Relationships", data: RelationshipsCategoryData)
                .padding(.bottom)
            
            Spacer()
            
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

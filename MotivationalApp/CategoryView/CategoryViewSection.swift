//
//  CategoryViewSection.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryViewSection: View {
    let header: String
    let categoryTitleName: String
    let categoryImageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .fontWeight(.bold)
                .font(.title2)
                .padding(.leading, 10)

            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    
                    HStack() {
                        ForEach(0..<5) {_ in
                            Button(action: {
                                print("clicked")
                            }, label: {
                                CategoryViewCard(categoryTitleName: categoryTitleName, categoryImageName: categoryImageName)
                            })
                        }
                    }
                    
                    .padding(.bottom, 6)
                    
                    HStack() {
                        ForEach(0..<5) {_ in
                            Button(action: {
                                print("clicked")
                            }, label: {
                                CategoryViewCard(categoryTitleName: categoryTitleName, categoryImageName: categoryImageName)
                            })
                        }
                    }
                }
                .padding(.leading, 8)
            
            }
        }
    }
}

struct CategoryViewSection_Previews: PreviewProvider {
    static var previews: some View {
        CategoryViewSection(header: "Productivity", categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder")
    }
}

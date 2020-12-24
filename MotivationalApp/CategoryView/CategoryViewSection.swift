//
//  CategoryViewSection.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryViewSection: View {
    let header: String
    let data: [CategoryViewData]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .fontWeight(.bold)
                .font(.title2)
                .padding(.leading, 10)

            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack() {
                        CategoryViewCardList(data: data, range: 0..<data.count/2)
                    }
                    
                    .padding(.bottom, 6)
                    
                    HStack() {
                        CategoryViewCardList(data: data, range: data.count/2..<data.count)
                    }
                }
                .padding(.leading, 8)
            }
        }
    }
}

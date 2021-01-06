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
                .font(.title3)
                .padding(.leading, 10)

            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    HStack() {
                        CategoryViewCardList(data: data, range: 0..<data.count/2)
                        
                        Spacer()
                    }
                    
                    .padding(.bottom, 6)
                    
                    HStack() {
                        CategoryViewCardList(data: data, range: data.count/2..<data.count)
                        
                        Spacer()
                    }
                }
                .padding(.leading, 8)
            }
        }
    }
}

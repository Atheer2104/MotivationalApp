//
//  CategoryViewSection.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryViewSection: View {
    let header: String
    let data: [hardcodedCategoryViewData]
    @EnvironmentObject var categoryViewSettings: CategoryViewSettings
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .fontWeight(.bold)
                .font(.title2)
                .padding(.leading, 10)

            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack {
                    
                    HStack() {
                        ForEach(0..<data.count/2) { index in
                            Button(action: {
                                categoryViewSettings.isShowingCategoryView.toggle()
                                print(data[index].videoIDs)
                            }, label: {
                                CategoryViewCard(categoryTitleName: data[index].categoryTitleName, categoryImageName: data[index].categoryImageName)
                            })
                        }
                    }
                    
                    .padding(.bottom, 6)
                    
                    HStack() {
                        ForEach(data.count/2..<data.count) { index in
                            Button(action: {
                                categoryViewSettings.isShowingCategoryView.toggle()
                                print(data[index].videoIDs)
                            }, label: {
                                CategoryViewCard(categoryTitleName: data[index].categoryTitleName, categoryImageName: data[index].categoryImageName)
                            })
                        }
                    }
                }
                .padding(.leading, 8)
            
            }
        }
    }
}
/*
struct CategoryViewSection_Previews: PreviewProvider {
    static var previews: some View {
        CategoryViewSection(header: "Productivity", categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder")
    }

*/


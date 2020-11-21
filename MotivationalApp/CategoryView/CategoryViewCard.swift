//
//  CategoryViewCard.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-11.
//

import SwiftUI

struct CategoryViewCard: View {
    
    let categoryTitleName: String
    let categoryImageName: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color(UIColor.systemGray5))
                .frame(width: UIScreen.main.bounds.width/2.5, height: 90)
                .cornerRadius(6)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 4)
            
            HStack {
                VStack {
                    Text(categoryTitleName)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.primary)
                        .offset(x: 6, y: 5)
                    
                    Spacer()
                }
                
                Spacer()
                
                Image(categoryImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            .frame(width: UIScreen.main.bounds.width/2.5, height: 90)
        }
        .padding(.trailing, 8)

    }
}

struct CategoryViewCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryViewCard(categoryTitleName: "Study", categoryImageName: "categoryImagePlaceholder")
    }
}

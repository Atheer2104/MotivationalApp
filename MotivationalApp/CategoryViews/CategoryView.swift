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
                .padding(.bottom)
            
            HStack {
                Text("Categories")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    Group {
                        CategoryViewSection(header: "Motivational Speakers One", data: MotivationalSpeakersOne)
                                .padding(.top)
                       
                        Spacer()
                       
                        CategoryViewSection(header: "Relationships", data: Relationships)
                       
                        Spacer()
                       
                        CategoryViewSection(header: "Mindset", data: Mindset)
                        
                        Spacer()
                        
                        CategoryViewSection(header: "Everyday Motivation", data: Everyday)
                        
                        Spacer()
                        
                        CategoryViewSection(header: "Female Motivation Speakers", data: FemaleMotivationSpeakers)
                    }
                    
                    
                    Group {
                        Spacer()
                        
                        CategoryViewSection(header: "Health", data: Health)
                        
                        Spacer()
                        
                        CategoryViewSection(header: "Figures 1", data: FiguresOne)

                        
                        Spacer()
                        
                        CategoryViewSection(header: "Figures 2", data: FiguresTwo)
                       
                       Spacer()
                       
                       CategoryViewSection(header: "Motivational Speakers 2", data: MotivationalSpeakersTwo)
                           .padding(.bottom)
                    }
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



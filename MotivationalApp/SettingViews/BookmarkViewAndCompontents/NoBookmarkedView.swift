//
//  NoBookmarkedView.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-21.
//

import SwiftUI

struct NoBookmarkedView: View {
    var body: some View {
        VStack(alignment:.center) {
            Indicator()
                .padding()
                
            Divider()
                .background(Color.primary)
            
            Spacer()
            
            Text("Currently there are no bookmarked videos")
                .font(.headline)
                .foregroundColor(.primary)
                
            
            HStack {
                Text("To bookmark video press the bookmark icon")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
                Image("bookmark-border")
            }
            
            Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(.systemGray3).ignoresSafeArea())
        
    }
}



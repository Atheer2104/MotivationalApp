//
//  SettingView.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-02.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(spacing: 0) {
            
            Indicator()
                .padding()
                
            Divider()
                .background(Color.primary)
            
            Bookmarks()
    
            ShareWithFriends()
            
            SendFeedback()
            
            Spacer()
            
        }
        .background(Color(.systemGray3).ignoresSafeArea())
    }
}

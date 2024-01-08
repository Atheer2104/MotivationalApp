//
//  ShareWithFriends.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import SwiftUI

struct ShareWithFriends: View {
    @State var showShareSheet = false
    //TODO: needs to be changed to applink
    let data = URL(string: "https://www.google.com")
    
    var body: some View {
        HStack {
            Button(action: {
                self.showShareSheet = true
            }, label: {
                SettingsViewLabel(title: "Share with Friends", imageName: "share")
            })
            .sheet(isPresented: $showShareSheet, content: {
                ShareSheet(activityItems: [data!])
            })
            
            Spacer()
            
            Image("chevronRight")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
            
        }
        .padding()
    }
}

struct ShareWithFriends_Previews: PreviewProvider {
    static var previews: some View {
        ShareWithFriends()
    }
}

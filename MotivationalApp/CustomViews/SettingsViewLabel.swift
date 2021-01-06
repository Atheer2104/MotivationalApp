//
//  SettingsViewLabel.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import SwiftUI

struct SettingsViewLabel: View {
    var title: String
    var imageName: String
    
    var body: some View {
        Label {
            Text(title)
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(.primary)
        } icon: {
            Image(imageName)
                .resizable()
                .frame(width: 44, height: 44, alignment: .center)
        }
    }
}

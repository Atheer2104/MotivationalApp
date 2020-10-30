//
//  ContentView.swift
//  MotivationalApp
//
//  Created by atheer on 2020-07-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VideoPlayer()
                
            VideoPlayerAdditionalControlls()
            
        }
        .background(Color(.black).ignoresSafeArea())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

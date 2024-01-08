//
//  SpinnerProgressIndicator.swift
//  MotivationalApp
//
//  Created by atheer on 2020-12-28.
//

import SwiftUI

struct SpinnerProgressIndicator: View {
    let style = StrokeStyle(lineWidth: 4, lineCap: .round)
    @State var animate = false
    let primaryColor = Color(UIColor.systemIndigo)
    let secondaryColor = Color.white.opacity(0.4)
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 140, height: 140, alignment: .center)
                .foregroundColor(Color.white)
                .cornerRadius(20)
                .shadow(radius: 5)
            
            
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(AngularGradient(gradient: .init(colors: [primaryColor, secondaryColor]), center: .center) ,style: style)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                .frame(width: 55, height: 55, alignment: .center)
        }
        .onAppear() {
            self.animate = true 
        }
        
        .onDisappear() {
            self.animate = false
        }
    }
    
}

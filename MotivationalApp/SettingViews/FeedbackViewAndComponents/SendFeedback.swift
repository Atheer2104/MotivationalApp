//
//  SendFeedback.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import SwiftUI
import MessageUI

struct SendFeedback: View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.isShowingMailView.toggle()
            }, label: {
                SettingsViewLabel(title: "Send Feedback", imageName: "feedback")
            })
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result)
            }
            
            Spacer()
            
            Image("chevronRight")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
        }
        .padding()
    }
}

struct SendFeedback_Previews: PreviewProvider {
    static var previews: some View {
        SendFeedback()
    }
}

//
//  MailView.swift
//  MotivationalApp
//
//  Created by atheer on 2021-01-03.
//

import Foundation
import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
                defer {
                    // defer will run after we have send the email or encounterd an error
                    $presentation.wrappedValue.dismiss()
                }
                guard error == nil else {
                    self.result = .failure(error!)
                    return
                }
                self.result = .success(result)
            }
        }

        func makeCoordinator() -> Coordinator {
            return Coordinator(presentation: presentation,
                               result: $result)
        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
            let vc = MFMailComposeViewController()
            vc.mailComposeDelegate = context.coordinator
            //TODO: need to changed to correct information
            vc.setToRecipients(["address@example.com"])
            vc.setSubject("Hello!")
            vc.setMessageBody("Hello from California!", isHTML: false)
            return vc
        }

        func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                    context: UIViewControllerRepresentableContext<MailView>) {

        }
}

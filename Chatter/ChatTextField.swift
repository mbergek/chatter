//
//  ChatTextField.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct ChatTextField: View {
    
    let sendAction: (String) -> Void
    
    @State private var messageText = ""
    
    private func sendButtonTapped() {
        sendAction(messageText)
        messageText = ""
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.white)
                .shadow(color: .shadow, radius: 3, x: 0, y: -2)
            HStack {
                TextField("Type something", text: $messageText)
                    .frame(height: 60)
                
                Button(action: sendButtonTapped) {
                    Image("send_message")
                    .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.leading, 16)
                }
            }
            .padding([.leading, .trailing])
            .background(Color.white)
        }
        .frame(height: 60)
    }
}

struct ChatTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ChatTextField(sendAction: { _ in })
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}

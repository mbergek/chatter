//
//  ChatView.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    let currentUser: Contact
    let receiver: Contact
    
    @ObservedObject private var keyboardObserver = KeyboardObserver()
    
    @State private var messages: [Message] = [
        Message(id: 0, text: "Morbi scelerisque luctus velit", contact: Contact(name: "Name", avatar: nil, id: "id", isOnline: true)),
        Message(id: 1, text: "Pellentesque ipsum. Mauris elem enes tumen mauris vitae tortor. Pellentesque ipsum. ", contact: Contact(name: "Name", avatar: nil, id: "id", isOnline: true)),
        Message(id: 2, text: "Phasellus enim erat esi, vestibulum veles?", contact: Contact(name: "Name", avatar: nil, id: "me", isOnline: true)),
        Message(id: 3, text: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.", contact: Contact(name: "Name", avatar: nil, id: "id", isOnline: true)),
        Message(id: 4, text: "Mauris tincidunt sem", contact: Contact(name: "Name", avatar: nil, id: "me", isOnline: true)),
    ]
    
    init(currentUser: Contact, receiver: Contact) {
        self.currentUser = currentUser
        self.receiver = receiver
        
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    private func isMessageLastFromContact(at index: Int) -> Bool {
        let message = messages[index]
        let next = index < messages.count - 1 ? messages[index + 1] : nil
        return message.contact != next?.contact
    }
    
    private func onSendTapped(message: String) {
        // TODO: Send message
    }
    
    var body: some View {
        ZStack {
            Color.background.edgesIgnoringSafeArea(.top)
            VStack {
                List {
                    ForEach(0..<messages.count, id: \.self) { i in
                        ChatMessageRow(
                            message: self.messages[i],
                            isIncoming: self.messages[i].contact.id != self.currentUser.id,
                            isLastFromContact: self.isMessageLastFromContact(at: i))
                            .listRowInsets(EdgeInsets(
                                top: i == 0 ? 16 : 0,
                                leading: 12,
                                bottom: self.isMessageLastFromContact(at: i) ? 20 : 6,
                                trailing: 12))
                    }
                }
                
                ChatTextField(sendAction: onSendTapped)
                    .padding(.bottom, keyboardObserver.keyboardHeight)
                    .animation(.easeInOut(duration: 0.3))
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(currentUser: Contact(name: "Me", avatar: nil, id: "me", isOnline: true), receiver: Contact(name: "Other", avatar: nil, id: "other", isOnline: true))
    }
}

//
//  ContactsView.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct ContactsView: View {
    
    @EnvironmentObject private var store: AppStore
    
    @State private var items: [ContactRow.ContactItem] = [
        .init(
            contact: Contact(name: "Some Name", avatar: nil, id: "0", isOnline: true),
            lastMessage: "This is my last message that I sent you",
            unread: true),
        .init(
            contact: Contact(name: "Other Name", avatar: nil, id: "1", isOnline: false),
            lastMessage: "This is my last message that I sent you",
            unread: false),
        .init(
            contact: Contact(name: "Third Name", avatar: nil, id: "2", isOnline: true),
            lastMessage: "This is my last message that I sent you",
            unread: false)
    ]
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        List {
            ForEach(0..<items.count, id: \.self) { i in
                
                ZStack {
                    ContactRow(item: self.items[i])
                    
                    self.store.state.currentUser.map {
                        currentUser in
                        
                        NavigationLink(destination: ChatView(currentUser: currentUser, receiver: self.items[i].contact)) {
                            EmptyView()
                        }
                    }
                }
                .background(Color.white)
                .shadow(color: i == self.items.count - 1 ? Color(UIColor.black.withAlphaComponent(0.08)) : Color.clear, radius: 10, x: 0, y: 2 )
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarTitle("Contacts", displayMode: .inline)
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

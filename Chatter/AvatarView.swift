//
//  AvatarView.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import SwiftUI

struct AvatarView: View {

    private let showsOnlineStatus: Bool
    
    let url: URL?
    let isOnline: Bool

    init(url: URL?, isOnline: Bool) {
        self.url = url
        self.isOnline = isOnline
        showsOnlineStatus = true
    }
    init(url: URL?) {
        self.url = url
        self.isOnline = false
        self.showsOnlineStatus = false
    }
    
    var body: some View {
        ZStack {
            Image("avatar_placeholder0")
                .resizable()
                .frame(width: 37, height: 37)
            if showsOnlineStatus {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(isOnline ? .green : .red)
                    .padding([.leading, .top], 25)
            }
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AvatarView(url: nil, isOnline: true)
                .previewLayout(.fixed(width: 100, height: 100))

            AvatarView(url: nil, isOnline: false)
                .previewLayout(.fixed(width: 100, height: 100))

        }
    }
}

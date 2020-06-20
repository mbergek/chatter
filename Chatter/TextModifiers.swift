//
//  TextModifiers.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.largeTitle.weight(.bold))
            .foregroundColor(.cometChatBlue)
    }
}

struct BodyText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.body)
    }
}

//
//  AppStore.swift
//  Chatter
//
//  Created by Martin on 2020-06-21.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

class AppStore: ObservableObject {
    struct AppState {
        var currentUser: Contact?
    }
    
    @Published private(set) var state = AppState(currentUser: nil)
    
    func setCurrentUser(_ user: Contact?) {
        state.currentUser = user
    }
}

//
//  KeyboardObserver.swift
//  Chatter
//
//  Created by Martin on 2020-06-21.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import Foundation

import Combine
import SwiftUI

class KeyboardObserver: ObservableObject {
    @Published private(set) var keyboardHeight: CGFloat = 0
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.keyboardHeight, on: self)
            .store(in: &cancellables)
    }
    
    let keyboardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .compactMap { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height }
    
    let keyboardWillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ -> CGFloat in 0 }
    
    
}


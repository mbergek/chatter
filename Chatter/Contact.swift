//
//  Contact.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import Foundation

struct Contact: Identifiable, Equatable {
    let name: String
    let avatar: URL?
    let id: String
    var isOnline: Bool
}

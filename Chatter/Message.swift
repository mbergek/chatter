//
//  Message.swift
//  Chatter
//
//  Created by Martin on 2020-06-20.
//  Copyright © 2020 Spotwise. All rights reserved.
//

import Foundation

struct Message: Identifiable {
    let id: Int
    let text: String
    let contact: Contact
}

//
//  Comment.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import Foundation
import SwiftData

@Model
class Comment {
    var name: String

    init(name: String) {
        self.name = name
    }
}

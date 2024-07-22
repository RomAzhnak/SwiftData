//
//  ToDoList.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import Foundation
import SwiftData

@Model
class ToDo {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var comments = [Comment]()

    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}

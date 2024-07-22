//
//  ToDo_SwiftDataApp.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import SwiftData
import SwiftUI

@main
struct ToDo_SwiftData: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDo.self)
    }
}

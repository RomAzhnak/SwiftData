//
//  ContentView.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext

    @State private var path = [ToDo]()
    @State private var sortOrder = SortDescriptor(\ToDo.name)
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path) {
            ToDoListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("ToDo")
                .navigationDestination(for: ToDo.self, destination: EditToDoView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Add ToDo", systemImage: "plus", action: addToDo)

                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\ToDo.name))

                            Text("Priority")
                                .tag(SortDescriptor(\ToDo.priority, order: .reverse))

                            Text("Date")
                                .tag(SortDescriptor(\ToDo.date))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }

    func addToDo() {
        let todo = ToDo()
        modelContext.insert(todo)
        path = [todo]
    }
}

#Preview {
    ContentView()
}

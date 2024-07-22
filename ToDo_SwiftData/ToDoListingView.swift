//
//  ToDoListingView.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import SwiftData
import SwiftUI

struct ToDoListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\ToDo.priority, order: .reverse), SortDescriptor(\ToDo.name)]) var todos: [ToDo]
    
    init(sort: SortDescriptor<ToDo>, searchString: String) {
        _todos = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    var body: some View {
        List {
            ForEach(todos) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading) {
                        Text(todo.name)
                            .font(.headline)

                        Text(todo.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteToDos)
        }
    }

    func deleteToDos(_ indexSet: IndexSet) {
        for index in indexSet {
            let todo = todos[index]
            modelContext.delete(todo)
        }
    }
}

#Preview {
    ToDoListingView(sort: SortDescriptor(\ToDo.name), searchString: "")
}

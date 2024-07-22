//
//  EditToDoView.swift
//  ToDo_SwiftData
//
//  Created by Fusion Tech on 19.07.2024.
//

import SwiftUI
import SwiftData

struct EditToDoView: View {
    @Bindable var todo: ToDo
    @State private var newCommentName = ""

    var body: some View {
        Form {
            TextField("Name", text: $todo.name)
            TextField("Details", text: $todo.details, axis: .vertical)
            DatePicker("Date", selection: $todo.date)

            Section("Priority") {
                Picker("Priority", selection: $todo.priority) {
                    Text("Low").tag(1)
                    Text("Mid").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(.segmented)
            }

            Section("Comments") {
                ForEach(todo.comments) { comment in
                    Text(comment.name)
                }

                HStack {
                    TextField("Add a new comment in \(todo.name)", text: $newCommentName)

                    Button("Add", action: addComment)
                }
            }
        }
        .navigationTitle("Edit ToDo")
        .navigationBarTitleDisplayMode(.inline)
    }

    func addComment() {
        guard newCommentName.isEmpty == false else { return }

        withAnimation {
            let comment = Comment(name: newCommentName)
            todo.comments.append(comment)
            newCommentName = ""
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ToDo.self, configurations: config)
        let example = ToDo(name: "Example ToDo", details: "Example details go here and will automatically expand vertically as they are edited.")
        return EditToDoView(todo: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

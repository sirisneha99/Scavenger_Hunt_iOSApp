//
//  TaskListView.swift
//  Scavenger Hunt
//
//  Created by sneha siri nagabathula on 9/25/25.
//


import SwiftUI

struct TaskListView: View {
    @State private var tasks = [
        Task(title: "Take a photo of a tree", description: "Find a tree and snap a picture."),
        Task(title: "Find a landmark", description: "Take a picture near a landmark."),
        Task(title: "Selfie at the park", description: "Capture a selfie while in a park.")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    NavigationLink(destination: TaskDetailView(task: $tasks[index])) {
                        HStack {
                            Text(tasks[index].title)
                            if tasks[index].isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Scavenger Hunt")
        }
    }
}

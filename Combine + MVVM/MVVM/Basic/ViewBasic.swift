//
//  ViewBasic.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import SwiftUI

struct ViewBasic: View {
    
    @State private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.toggleTaskCompletion(task: task)
                                }
                        }
                    }
                }
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)
                    Button(action: {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }, label: {
                        Text("Add")
                    })
                }
                .padding()
            }
            .navigationTitle("Task")
        }
    }
}

#Preview {
    ViewBasic()
}

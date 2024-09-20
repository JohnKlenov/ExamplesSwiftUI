//
//  ViewModelBasic.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 14.09.24.
//

import SwiftUI

@Observable class TaskViewModel {
    
    var tasks: [Task] = [Task(title: "Wash the dog", isCompleted: false), Task(title: "Wash the dishes", isCompleted: true), Task(title: "Throw out the trash", isCompleted: true)]
    
    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    func toggleTaskCompletion(task:Task) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
}

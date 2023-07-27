//
//  AddTaskView.swift
//  SwiftUI_Playground
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/07/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var newTaskName = ""

    var body: some View {
        HStack {
            TextField("Enter task name", text: $newTaskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Add Task") {
                // Step 6: Add a new task to the list
                taskManager.addTask(name: newTaskName)
                newTaskName = ""
            }
        }
        .padding()
    }
}
struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

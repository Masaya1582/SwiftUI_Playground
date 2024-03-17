//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @State private var count: Int = 0
    @State private var isAuthenticated: Bool = false

    // A structure that holds all dependencies.
    private var taskID: TaskID {
        TaskID(count: count, isAuthenticated: isAuthenticated)
    }

    var body: some View {
        VStack {
            Text("Hello, World!")
                .task(id: taskID) {
                    // This block is executed when the view appears
                    // and whenever any property within `taskID` changes.
                    await performTask()
                }

            // Increment count
            Button("Increment Count") {
                count += 1
            }

            // Toggle authentication
            Button("Toggle Authentication") {
                isAuthenticated.toggle()
            }
        }
    }

    private func performTask() async {
        // Perform some asynchronous work here.
        // This could involve fetching data, performing calculations, etc.
        print("Performing task with count \(count) and isAuthenticated \(isAuthenticated)")
    }

    // A structure to hold the ID properties for the task modifier.
    struct TaskID: Equatable {
        let count: Int
        let isAuthenticated: Bool
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    private let sampleCommands = [
        Command(name: "ls", description: "List directory contents"),
        Command(name: "cd", description: "Change the current directory"),
        Command(name: "pwd", description: "Print working directory"),
        Command(name: "cp", description: "Copy files and directories"),
        Command(name: "mv", description: "Move/rename files and directories"),
        Command(name: "rm", description: "Remove files or directories"),
        Command(name: "chmod", description: "Change file modes or Access Control Lists"),
        Command(name: "chown", description: "Change file owner and group"),
        Command(name: "mkdir", description: "Make directories"),
        Command(name: "rmdir", description: "Remove empty directories")
    ]

    var body: some View {
        NavigationView {
            List(sampleCommands) { command in
                CommandRow(command: command)
            }
            .navigationTitle("Linux Commands")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CommandRow: View {
    let command: Command

    var body: some View {
        VStack(alignment: .leading) {
            Text(command.name)
                .font(.headline)
                .foregroundColor(.blue)
            Text(command.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
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

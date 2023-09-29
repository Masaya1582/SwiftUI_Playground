//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        List {
            Section(header: Text("Today")) {
                WidgetListItem(title: "Task 1", description: "Complete task 1")
                WidgetListItem(title: "Task 2", description: "Complete task 2")
            }

            Section(header: Text("Tomorrow")) {
                WidgetListItem(title: "Task 3", description: "Complete task 3")
                WidgetListItem(title: "Task 4", description: "Complete task 4")
            }

            Section(header: Text("Tomorrow")) {
                WidgetListItem(title: "Task 3", description: "Complete task 3")
                WidgetListItem(title: "Task 4", description: "Complete task 4")
            }

            Section(header: Text("Tomorrow")) {
                WidgetListItem(title: "Task 3", description: "Complete task 3")
                WidgetListItem(title: "Task 4", description: "Complete task 4")
            }
        }
        .listStyle(GroupedListStyle())
        .background(Color.white) // Set the background color of the List
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.light)
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}

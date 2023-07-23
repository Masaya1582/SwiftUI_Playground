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
        NavigationView {
            List {
                Section(header: Text("View Modifiers")) {
                    Row(title: ".foregroundColor", description: "Sets the color of the view.")
                    Row(title: ".font", description: "Sets the font of the text.")
                    Row(title: ".padding", description: "Adds padding around the view.")
                    Row(title: ".background", description: "Sets the background color of the view.")
                }

                Section(header: Text("Layout Modifiers")) {
                    Row(title: ".frame", description: "Sets the size of the view.")
                    Row(title: ".offset", description: "Offsets the view's position.")
                    Row(title: ".alignmentGuide", description: "Defines a custom alignment guide.")
                }

                Section(header: Text("Animation Modifiers")) {
                    Row(title: ".animation", description: "Applies an animation to the view.")
                    Row(title: ".transition", description: "Adds a transition animation.")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("SwiftUI Modifiers Cheatsheet")
        }
    }
}

struct Row: View {
    var title: String
    var description: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

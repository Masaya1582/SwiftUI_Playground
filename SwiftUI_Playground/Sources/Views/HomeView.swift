//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    ProgrammaticNavigationView {
                        Text("View1")
                    } label: {
                        Text("Go to View1")
                    }

                    ProgrammaticNavigationView {
                        Text("View2")
                    } label: {
                        Text("Go to View2")
                    }

                    ProgrammaticNavigationView {
                        Text("View3")
                    } label: {
                        Text("Go to View3")
                    }
                }
            }
            .onTapGesture {
                return
            }
        }
    }
}

struct ProgrammaticNavigationView<Content>: View where Content: View {
    let destination: () -> Content
    let label: () -> Content
    @State var isActive = false
    var body: some View {
        ZStack {
            Button(action: { isActive = true }) {
                label()
            }
            .buttonStyle(PlainButtonStyle())
            NavigationLink(destination: destination(), isActive: $isActive) {
                EmptyView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

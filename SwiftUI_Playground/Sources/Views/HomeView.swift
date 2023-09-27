//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = JokeViewModel()

    var body: some View {
        VStack {
            Text("Funny Joke App")
                .modifier(CustomLabel(foregroundColor: .black, size: 24))
                .padding()
            Button {
                viewModel.fetchRandomJoke()
            } label: {
                Text("Get a joke")
            }
            .modifier(CustomButton(foregroundColor: .white, backgroundColor: .green))

            if let joke = viewModel.joke {
                Text(joke.category)
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))
                    .padding()

                Text(joke.joke)
                    .modifier(CustomLabel(foregroundColor: .black, size: 20))
                    .padding()
            }
            Spacer()
        }
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

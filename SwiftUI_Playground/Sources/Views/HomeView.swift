//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var shouldInvertColor = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Today's Weather")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()

                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)

                Text("Sunny")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()

                Text("26°C")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .padding()

                HStack {
                    WeatherDetail(icon: "drop.fill", title: "Humidity", value: "65%")
                    WeatherDetail(icon: "wind", title: "Wind", value: "5 mph")
                }
                .padding()

                Spacer()
            }
        }
    }
}

struct WeatherDetail: View {
    var icon: String
    var title: String
    var value: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 40))
            Text(title)
                .foregroundColor(.white)
                .font(.title)
            Text(value)
                .foregroundColor(.white)
                .font(.headline)
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

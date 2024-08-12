//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            EnhancedStatsView().tabItem {
                Image(systemName: "chart.bar")
                Text("Stats")
            }

            RosterView().tabItem {
                Image(systemName: "person.3")
                Text("Roster")
            }

            MainView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            NewsView().tabItem {
                Image(systemName: "newspaper")
                Text("News")
            }

            CoachView().tabItem {
                Image(systemName: "person")
                Text("Coach")
            }
        }
    }
}

struct MainView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            TeamInfoView()
            ScheduleView()
            Spacer()
        }
    }
}

struct TeamInfoView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Rutgers")
                .font(.title)
                .fontWeight(.bold)
            HStack(spacing: 10) {
                Text("AP Ranking: #21")
                Text("Record: 9-3")
                Text("Conf Record: 6-2")
            }
            .font(.subheadline)
        }
        .padding()
    }
}

struct ScheduleView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(0..<10) { game in
                    GameView(game: game)
                }
            }
            .padding()
        }
    }
}

struct GameView: View {
    var game: Int

    var body: some View {
        VStack {
            Text("Game \(game + 1)")
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(gameColor(game))
        }
    }

    func gameColor(_ game: Int) -> Color {
        if game < 3 {
            return Color.green
        } else if game < 6 {
            return Color.red
        } else {
            return Color.gray
        }
    }
}

struct EnhancedStatsView: View {
    let playerStats = [("John Doe", 25, 10, 5), ("Jane Smith", 20, 8, 4), ("Alex Johnson", 15, 7, 3)]

    var body: some View {
        NavigationView {
            List(playerStats, id: \.0) { player in
                NavigationLink(destination: PlayerStatsDetailView(player: player)) {
                    HStack {
                        Text(player.0)
                        Spacer()
                        Text("Points: \(player.1)")
                        Spacer()
                        Text("Rebounds: \(player.2)")
                        Spacer()
                        Text("Assists: \(player.3)")
                    }
                }
            }
            .navigationBarTitle("Player Stats")
        }
    }
}

// swiftlint:disable large_tuple
struct PlayerStatsDetailView: View {
    var player: (String, Int, Int, Int)

    var body: some View {
        VStack {
            Text(player.0)
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Points: \(player.1)")
                Spacer()
                Text("Rebounds: \(player.2)")
                Spacer()
                Text("Assists: \(player.3)")
            }
            .font(.title2)
        }
        .padding()
    }
}

struct RosterView: View {
    var body: some View {
        VStack {
            Text("Roster View")
                .font(.title)
                .fontWeight(.bold)
            List {
                ForEach(0..<10) { index in
                    NavigationLink(destination: MemberDetailView(member: "Player \(index + 1)")) {
                        Text("Player \(index + 1)")
                    }
                }
            }
        }
    }
}

struct MemberDetailView: View {
    var member: String

    var body: some View {
        VStack {
            Text(member)
                .font(.title)
                .fontWeight(.bold)
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            Text("Position: Pitcher")
            Text("Number: 23")
            Text("Age: 28")
        }
        .padding()
    }
}

struct NewsView: View {
    var body: some View {
        List {
            ForEach(0..<5) { _ in
                VStack(alignment: .leading) {
                    Text("Headline")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Details about the news")
                        .font(.subheadline)
                }
                .padding()
            }
        }
    }
}

struct CoachView: View {
    @State private var sliderValue = 0.5
    let offensiveSchemes = ["Scheme 1", "Scheme 2", "Scheme 3", "Scheme 4"]
    let defensiveSchemes = ["Scheme A", "Scheme B", "Scheme C", "Scheme D"]

    var body: some View {
        VStack {
            Section(header: Text("Offensive Schemes")) {
                ForEach(offensiveSchemes, id: \.self) { scheme in
                    Text(scheme)
                }
            }

            Section(header: Text("Defensive Schemes")) {
                ForEach(defensiveSchemes, id: \.self) { scheme in
                    Text(scheme)
                }
            }

            Section(header: Text("Aggressiveness")) {
                Slider(value: $sliderValue)
            }
        }
        .padding()
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
        MainView()
            .preferredColorScheme(.dark)
    }
}

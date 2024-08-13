//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Charts

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Your Portfolio")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("+32.02% vs last month")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                        Spacer()
                        Image(systemName: "bell")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    }
                    .padding(.horizontal)

                    Chart {
                        ForEach(sampleData, id: \.id) { data in
                            LineMark(
                                x: .value("Date", data.date),
                                y: .value("Value", data.value)
                            )
                            .foregroundStyle(.blue)
                        }
                    }
                    .frame(height: 200)
                    .padding(.horizontal)

                    HStack(spacing: 20) {
                        GraphCardView(title: "AAPL", data: sampleData)
                        GraphCardView(title: "TSLA", data: sampleData)
                    }
                    .padding(.horizontal)

                    HStack(spacing: 20) {
                        GraphCardView(title: "AMZN", data: sampleData)
                        GraphCardView(title: "GOOGL", data: sampleData)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(.dark)
    }
}

struct GraphCardView: View {
    var title: String
    var data: [ChartData]

    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Chart {
                ForEach(data, id: \.id) { data in
                    LineMark(
                        x: .value("Date", data.date),
                        y: .value("Value", data.value)
                    )
                    .foregroundStyle(.blue)
                }
            }
            .frame(height: 100)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

struct ChartData {
    let id: Int
    let date: Date
    let value: Double
}

private let sampleData: [ChartData] = [
    ChartData(id: 0, date: Date().addingTimeInterval(-2400 * 5), value: 1),
    ChartData(id: 1, date: Date().addingTimeInterval(-2400 * 4), value: 3),
    ChartData(id: 2, date: Date().addingTimeInterval(-2400 * 3), value: 2),
    ChartData(id: 3, date: Date().addingTimeInterval(-2400 * 2), value: 5),
    ChartData(id: 4, date: Date().addingTimeInterval(-2400 * 1), value: 4)
]

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

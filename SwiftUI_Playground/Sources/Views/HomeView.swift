//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import Charts

// Model for Chart Data
struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let sales: Double
}

// Sample Data
let salesData = [
    SalesData(month: "Jan", sales: 150.0),
    SalesData(month: "Feb", sales: 200.0),
    SalesData(month: "Mar", sales: 250.0),
    SalesData(month: "Apr", sales: 300.0),
    SalesData(month: "May", sales: 350.0),
    SalesData(month: "Jun", sales: 400.0),
    SalesData(month: "Jul", sales: 450.0),
    SalesData(month: "Aug", sales: 500.0),
    SalesData(month: "Sep", sales: 550.0),
    SalesData(month: "Oct", sales: 600.0),
    SalesData(month: "Nov", sales: 650.0),
    SalesData(month: "Dec", sales: 700.0)
]

// Main Chart View
struct StylishChartView: View {
    var body: some View {
        Chart {
            ForEach(salesData) { data in
                BarMark(
                    x: .value("Month", data.month),
                    y: .value("Sales", data.sales)
                )
                .foregroundStyle(by: .value("Month", data.month))
                .annotation(position: .top) {
                    Text("\(Int(data.sales))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: 1)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(values: .automatic(desiredCount: 10)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
        .padding()
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Monthly Sales Data")
                .font(.title)
                .padding()
            StylishChartView()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
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

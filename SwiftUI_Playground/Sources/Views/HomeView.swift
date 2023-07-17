//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []

    var body: some View {
        VStack {
            MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)
            Text(summary)
        }
        .padding()
    }

    var summary: String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }.formatted()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var date = Date()

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                DatePicker("Compact",
                           selection: $date,
                           displayedComponents: [.date, .hourAndMinute]
                ).datePickerStyle(.compact)
                DatePicker("Wheel",
                           selection: $date,
                           displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.wheel)
                DatePicker("Graphical",
                           selection: $date,
                           displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}

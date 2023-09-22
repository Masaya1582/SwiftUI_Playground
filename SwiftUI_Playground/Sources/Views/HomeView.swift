//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VintageSettingRow(iconName: "gear", title: "General")
                VintageSettingRow(iconName: "wifi", title: "Wi-Fi")
                VintageSettingRow(iconName: "wave.3.forward.circle.fill", title: "Bluetooth")
                VintageSettingRow(iconName: "antenna.radiowaves.left.and.right", title: "Cellular")
                VintageSettingRow(iconName: "phone.circle", title: "Phone")
                VintageSettingRow(iconName: "music.note", title: "Music")
                VintageSettingRow(iconName: "mail", title: "Mail")
                VintageSettingRow(iconName: "calendar", title: "Calendar")
                VintageSettingRow(iconName: "photo", title: "Photos")
                VintageSettingRow(iconName: "camera", title: "Camera")
            }
        }
        .padding()
        .foregroundColor(.black)
    }
}

struct VintageSettingRow: View {
    var iconName: String
    var title: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.system(size: 28))
            Text(title)
                .font(.title)
                .fontWeight(.semibold)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 20))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
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

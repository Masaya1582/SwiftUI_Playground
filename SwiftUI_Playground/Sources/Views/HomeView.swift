//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import MapKit

struct IdentifiablePoint: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String?
}

struct HomeView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    private let annotation = IdentifiablePoint(
        coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        title: "San Francisco"
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [annotation]) { item in
            MapPin(coordinate: item.coordinate, tint: .red)
        }
        .edgesIgnoringSafeArea(.all)
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

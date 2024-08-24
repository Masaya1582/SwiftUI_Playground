//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        VStack {
            // Map view
            Map(coordinateRegion: $region, annotationItems: [Landmark.example]) { landmark in
                MapMarker(coordinate: landmark.coordinate, tint: .red)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(height: 400)

            // Display the coordinate details
            Text("Latitude: \(region.center.latitude)")
            Text("Longitude: \(region.center.longitude)")
        }
        .padding()
    }

}

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D

    static let example = Landmark(name: "Apple Park", coordinate: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090))
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

//
//  HomeView.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var showingAlert = false
    @State private var selectedLocation: CLLocationCoordinate2D?
    @State private var locations: [CLLocationCoordinate2D] = []

    var body: some View {
        MapView(locations: $locations) { location in
            self.selectedLocation = location
            self.showingAlert = true
        }
        .ignoresSafeArea()
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text(""),
                message: Text("Latitude: \(selectedLocation?.latitude ?? -1), Longitude: \(selectedLocation?.longitude ?? -1)"),
                primaryButton: .default(Text("OK")) {
                    guard let location = selectedLocation else {
                        return
                    }
                    self.addLocation(location)
                }, secondaryButton: .cancel())
        }
    }

    private func addLocation(_ location: CLLocationCoordinate2D) {
        locations.append(location)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
